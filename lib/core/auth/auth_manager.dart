import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../features/auth/domain/entities/auth_tokens.dart';
import '../../features/auth/domain/entities/user.dart';
import '../network/api_service.dart';
import 'secure_storage_service.dart';

/// Global authentication manager for handling auth state.
/// Provides centralized authentication state management across the app.
@singleton
class AuthManager {
  AuthManager(this._secureStorage, this._apiService);

  final SecureStorageService _secureStorage;
  final ApiService _apiService;

  // Storage keys
  static const String _accessTokenKey = 'access_token_v2';
  static const String _refreshTokenKey = 'refresh_token_v2';
  static const String _userDataKey = 'user_data_v2';

  // Stream controllers for reactive state management
  final StreamController<User?> _userController =
      StreamController<User?>.broadcast();
  final StreamController<bool> _authStateController =
      StreamController<bool>.broadcast();

  // Current user and authentication state
  User? _currentUser;
  AuthTokens? _currentTokens;
  bool _isAuthenticated = false;

  /// Stream of current user
  Stream<User?> get userStream => _userController.stream;

  /// Stream of authentication state
  Stream<bool> get authStateStream => _authStateController.stream;

  /// Current authenticated user
  User? get currentUser => _currentUser;

  /// Current authentication tokens
  AuthTokens? get currentTokens => _currentTokens;

  /// Whether user is currently authenticated
  bool get isAuthenticated => _isAuthenticated;

  /// Initialize the auth manager and check for existing session
  Future<void> initialize() async {
    try {
      await _loadStoredAuthData();

      if (_currentTokens != null) {
        // Validate stored tokens
        final isValid = await _validateTokens();
        if (isValid) {
          _setAuthenticatedState(true);
        } else {
          await logout();
        }
      } else {
        // No stored tokens, set as unauthenticated
        _setAuthenticatedState(false);
      }
    } catch (e) {
      // Clear any corrupted data and start fresh
      await logout();
    }
  }

  /// Store authentication data after successful login
  Future<void> storeAuthData({
    required User user,
    required AuthTokens tokens,
  }) async {
    try {
      print('🔑 AuthManager: Storing auth data for user: ${user.email}');

      // Store tokens securely
      await _secureStorage.write(
        key: _accessTokenKey,
        value: tokens.accessToken,
      );
      await _secureStorage.write(
        key: _refreshTokenKey,
        value: tokens.refreshToken,
      );

      // Store user data (could be encrypted in production)
      await _secureStorage.write(key: _userDataKey, value: _userToJson(user));

      // Update ApiService with new tokens
      await _apiService.setTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );

      // Update internal state
      _currentUser = user;
      _currentTokens = tokens;

      print('🔑 AuthManager: Setting authenticated state to true');
      _setAuthenticatedState(true);

      print(
        '🔑 AuthManager: Auth data stored successfully. isAuthenticated: $_isAuthenticated',
      );
    } catch (e) {
      print('🔑 AuthManager: Error storing auth data: $e');
      throw Exception('Failed to store authentication data: $e');
    }
  }

  /// Refresh authentication tokens
  Future<bool> refreshTokens() async {
    if (_currentTokens?.refreshToken == null) {
      return false;
    }

    try {
      final newTokens = await _apiService.refreshToken(
        _currentTokens!.refreshToken,
      );

      if (newTokens != null) {
        await storeAuthData(user: _currentUser!, tokens: newTokens);
        return true;
      }
    } catch (e) {
      // Refresh failed, logout user
      await logout();
    }

    return false;
  }

  /// Update current user data
  Future<void> updateUser(User user) async {
    try {
      await _secureStorage.write(key: _userDataKey, value: _userToJson(user));
      _currentUser = user;
      _userController.add(_currentUser);
    } catch (e) {
      throw Exception('Failed to update user data: $e');
    }
  }

  /// Logout and clear all authentication data
  Future<void> logout() async {
    try {
      // Clear secure storage
      await _secureStorage.delete(key: _accessTokenKey);
      await _secureStorage.delete(key: _refreshTokenKey);
      await _secureStorage.delete(key: _userDataKey);

      // Clear ApiService tokens
      await _apiService.clearTokens();

      // Reset internal state
      _currentUser = null;
      _currentTokens = null;
      _setAuthenticatedState(false);
    } catch (e) {
      // Even if clearing fails, reset state
      _currentUser = null;
      _currentTokens = null;
      _setAuthenticatedState(false);
    }
  }

  /// Check if access token is valid (not expired)
  bool isAccessTokenValid() {
    if (_currentTokens?.accessToken == null) return false;

    try {
      // Simple JWT validation - check if token is not expired
      // In production, you might want more sophisticated validation
      final parts = _currentTokens!.accessToken.split('.');
      if (parts.length != 3) return false;

      // For now, assume token is valid if it exists
      // You can add proper JWT validation here
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Dispose resources
  void dispose() {
    _userController.close();
    _authStateController.close();
  }

  // Private methods

  /// Load stored authentication data
  Future<void> _loadStoredAuthData() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    final userData = await _secureStorage.read(key: _userDataKey);

    if (accessToken != null && refreshToken != null && userData != null) {
      _currentTokens = AuthTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
        tokenType: 'Bearer',
        expiresIn: 3600,
      );

      _currentUser = _userFromJson(userData);

      // Update ApiService with stored tokens
      await _apiService.setTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
  }

  /// Validate stored tokens
  Future<bool> _validateTokens() async {
    if (_currentTokens == null) return false;

    try {
      // Try to make a simple authenticated request to validate tokens
      // You can implement a /me endpoint or similar
      return isAccessTokenValid();
    } catch (e) {
      return false;
    }
  }

  /// Set authentication state and notify listeners
  void _setAuthenticatedState(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    _authStateController.add(_isAuthenticated);
    _userController.add(_currentUser);
  }

  /// Convert user to simple storage format
  String _userToJson(User user) {
    // Simple format for secure storage
    return [
      user.id,
      user.email,
      user.username,
      user.emailVerified.toString(),
      user.firstName,
      user.lastName,
      user.fullName,
      user.timezone,
      user.locale,
      user.status,
      user.createdAt.toIso8601String(),
      user.updatedAt.toIso8601String(),
    ].join('|');
  }

  /// Convert storage format to User
  User _userFromJson(String data) {
    final parts = data.split('|');

    if (parts.length < 12) {
      throw Exception('Invalid user data format');
    }

    return User(
      id: parts[0],
      email: parts[1],
      username: parts[2],
      emailVerified: parts[3] == 'true',
      firstName: parts[4],
      lastName: parts[5],
      fullName: parts[6],
      timezone: parts[7],
      locale: parts[8],
      status: parts[9],
      createdAt: DateTime.parse(parts[10]),
      updatedAt: DateTime.parse(parts[11]),
    );
  }
}
