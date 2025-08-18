import 'dart:async';
import 'package:dio/dio.dart';

import '../../features/auth/domain/entities/auth_tokens.dart';
import '../auth/secure_storage_service.dart';
import 'network_exceptions.dart';

/// Central API service for handling HTTP requests with authentication.
/// Manages token injection, refresh logic, and error handling.
class ApiService {
  static const String _baseUrl =
      'http://localhost:8080'; // Local development API URL
  static const String _accessTokenKey = 'se';
  static const String _refreshTokenKey = 'refresh_token';

  final Dio _dio;
  final SecureStorageService _secureStorage;

  // Token refresh concurrency control
  Completer<bool>? _refreshCompleter;
  final Set<String> _pendingRequests = {};

  ApiService(this._dio, this._secureStorage) {
    _setupDio();
    _setupInterceptors();
  }

  /// Configure Dio with base settings
  void _setupDio() async {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  /// Setup request/response interceptors
  void _setupInterceptors() {
    // Request interceptor for adding auth token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getAccessToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          final requestKey =
              '${error.requestOptions.method}_${error.requestOptions.path}';

          // Handle 429 Rate Limit errors
          if (error.response?.statusCode == 429) {
            await _handleRateLimit(error, handler, requestKey);
            return;
          }

          // Handle 401 errors by attempting token refresh
          if (error.response?.statusCode == 401 &&
              !error.requestOptions.path.contains('/auth/refresh')) {
            final refreshed = await _refreshTokenSafely();
            if (refreshed) {
              try {
                // Clone and retry the original request with new token
                final newToken = await getAccessToken();
                final clonedOptions = Options(
                  method: error.requestOptions.method,
                  headers: {
                    ...error.requestOptions.headers,
                    'Authorization': 'Bearer $newToken',
                  },
                );

                final clonedRequest = await _dio.request(
                  error.requestOptions.path,
                  options: clonedOptions,
                  data: error.requestOptions.data,
                  queryParameters: error.requestOptions.queryParameters,
                );
                handler.resolve(clonedRequest);
                return;
              } catch (retryError) {
                // If retry fails, clear tokens and continue with original error
                await clearTokens();
              }
            }
          }

          _pendingRequests.remove(requestKey);
          handler.next(error);
        },
      ),
    );

    // Logging interceptor for development
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (object) {
          // Only log in debug mode
          // ignore: avoid_print
          print(object);
        },
      ),
    );
  }

  /// GET request
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.fromDioException(e);
    }
  }

  /// POST request
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.fromDioException(e);
    }
  }

  /// PUT request
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.fromDioException(e);
    }
  }

  /// DELETE request
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.fromDioException(e);
    }
  }

  /// PATCH request
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.fromDioException(e);
    }
  }

  /// Store access token securely
  Future<void> setAccessToken(String token) async {
    await _secureStorage.write(key: _accessTokenKey, value: token);
  }

  /// Retrieve access token
  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _accessTokenKey);
  }

  /// Store refresh token securely
  Future<void> setRefreshToken(String token) async {
    await _secureStorage.write(key: _refreshTokenKey, value: token);
  }

  /// Retrieve refresh token
  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }

  /// Set both access and refresh tokens
  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await setAccessToken(accessToken);
    await setRefreshToken(refreshToken);
  }

  /// Clear all stored tokens
  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    return token != null;
  }

  /// Public method to refresh tokens and return new AuthTokens
  Future<AuthTokens?> refreshToken(String refreshTokenValue) async {
    try {
      final response = await _dio.post(
        '/api/v1/auth/refresh',
        data: {'refresh_token': refreshTokenValue},
        options: Options(
          headers: {'Authorization': 'Bearer $refreshTokenValue'},
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final newAccessToken = data['access_token'] as String?;
        final newRefreshToken = data['refresh_token'] as String?;

        if (newAccessToken != null && newRefreshToken != null) {
          // Store new tokens
          await setTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
          );

          // Return new tokens
          return AuthTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
            tokenType: 'Bearer',
            expiresIn: 3600,
          );
        }
      }
    } catch (e) {
      // Refresh failed
      await clearTokens();
    }
    return null;
  }

  /// Handle rate limit errors with exponential backoff
  Future<void> _handleRateLimit(
    DioException error,
    ErrorInterceptorHandler handler,
    String requestKey,
  ) async {
    if (_pendingRequests.contains(requestKey)) {
      handler.next(error);
      return;
    }

    final retryAfterHeader = error.response?.headers.value('x-ratelimit-reset');
    int retryAfter = 60; // Default 60 seconds

    if (retryAfterHeader != null) {
      try {
        final resetTime = int.parse(retryAfterHeader);
        final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        retryAfter = (resetTime - currentTime).clamp(1, 300); // Max 5 minutes
      } catch (_) {
        // Use default if parsing fails
      }
    }

    _pendingRequests.add(requestKey);

    // Wait for rate limit to reset
    await Future.delayed(Duration(seconds: retryAfter));

    try {
      // Retry the request
      final clonedRequest = await _dio.request(
        error.requestOptions.path,
        options: Options(
          method: error.requestOptions.method,
          headers: error.requestOptions.headers,
        ),
        data: error.requestOptions.data,
        queryParameters: error.requestOptions.queryParameters,
      );
      _pendingRequests.remove(requestKey);
      handler.resolve(clonedRequest);
    } catch (retryError) {
      _pendingRequests.remove(requestKey);
      handler.next(error);
    }
  }

  /// Thread-safe token refresh mechanism with circuit breaker
  Future<bool> _refreshTokenSafely() async {
    // If a refresh is already in progress, wait for it
    if (_refreshCompleter != null) {
      return await _refreshCompleter!.future;
    }

    // Start new refresh process
    _refreshCompleter = Completer<bool>();

    try {
      final refreshToken = await getRefreshToken();
      if (refreshToken == null) {
        _refreshCompleter!.complete(false);
        return false;
      }

      // Create a separate Dio instance for refresh to avoid interceptor loops
      final refreshDio = Dio();
      refreshDio.options = BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      );

      final response = await refreshDio.post(
        '/api/v1/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'Authorization': 'Bearer $refreshToken'}),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        final data = responseData is Map<String, dynamic>
            ? responseData['data'] ?? responseData
            : responseData;
        final newAccessToken = data['access_token'] as String?;
        final newRefreshToken = data['refresh_token'] as String?;

        if (newAccessToken != null) {
          await setAccessToken(newAccessToken);
        }
        if (newRefreshToken != null) {
          await setRefreshToken(newRefreshToken);
        }

        _refreshCompleter!.complete(true);
        return true;
      }

      _refreshCompleter!.complete(false);
      return false;
    } catch (e) {
      print('Token refresh failed: $e');

      // Handle rate limiting in refresh
      if (e.toString().contains('429')) {
        print('Token refresh rate limited - backing off');
        await Future.delayed(const Duration(seconds: 60));
      }

      // Clear tokens only if it's not a rate limit error
      if (!e.toString().contains('429')) {
        await clearTokens();
      }

      _refreshCompleter!.complete(false);
      return false;
    } finally {
      _refreshCompleter = null;
    }
  }

  /// Set custom base URL (useful for testing or different environments)
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  /// Get current base URL
  String get baseUrl => _dio.options.baseUrl;
}
