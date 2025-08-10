import 'package:injectable/injectable.dart';

import '../../../../core/auth/auth_manager.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/entities/auth_tokens.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

/// Implementation of AuthRepository using remote data source.
/// Handles token storage and manages auth state.
@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this._remoteDataSource,
    this._apiService,
    this._authManager,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final ApiService _apiService;
  final AuthManager _authManager;

  @override
  Future<AuthTokens> login({
    required String email,
    required String password,
  }) async {
    final response = await _remoteDataSource.login(
      email: email,
      password: password,
    );

    // Store tokens securely
    final tokens = response.tokens.toDomain();
    await _apiService.setAccessToken(tokens.accessToken);
    await _apiService.setRefreshToken(tokens.refreshToken);

    return tokens;
  }

  @override
  Future<AuthTokens> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _remoteDataSource.register(
      email: email,
      password: password,
      name: name,
    );

    // Store tokens securely
    final tokens = response.tokens.toDomain();
    await _apiService.setAccessToken(tokens.accessToken);
    await _apiService.setRefreshToken(tokens.refreshToken);

    return tokens;
  }

  @override
  Future<void> logout() async {
    try {
      // Attempt to logout on server
      await _remoteDataSource.logout();
    } catch (e) {
      // Continue with local logout even if server logout fails
    } finally {
      // Always clear local tokens
      await _apiService.clearTokens();
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userModel = await _remoteDataSource.getCurrentUser();
      return userModel.toDomain();
    } catch (e) {
      // Return null if user fetch fails (e.g., not authenticated)
      return null;
    }
  }

  @override
  Future<AuthTokens> refreshTokens() async {
    final tokensModel = await _remoteDataSource.refreshTokens();
    final tokens = tokensModel.toDomain();

    // Update stored tokens
    await _apiService.setAccessToken(tokens.accessToken);
    await _apiService.setRefreshToken(tokens.refreshToken);

    return tokens;
  }

  @override
  Future<bool> isAuthenticated() async {
    return await _apiService.isAuthenticated();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _remoteDataSource.sendPasswordResetEmail(email);
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    await _remoteDataSource.resetPassword(
      token: token,
      newPassword: newPassword,
    );
  }

  @override
  Future<void> verifyEmail(String token) async {
    await _remoteDataSource.verifyEmail(token);
  }

  @override
  Future<void> resendEmailVerification() async {
    await _remoteDataSource.resendEmailVerification();
  }

  @override
  Future<User> updateProfile({String? name, String? avatarUrl}) async {
    final userModel = await _remoteDataSource.updateProfile(
      name: name,
      avatarUrl: avatarUrl,
    );
    return userModel.toDomain();
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await _remoteDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await _remoteDataSource.deleteAccount();
    } finally {
      // Always clear local tokens after account deletion
      await _apiService.clearTokens();
    }
  }

  @override
  Future<void> initiateOtp(String email) async {
    await _remoteDataSource.initiateOtp(email);
  }

  @override
  Future<User> verifyOtp({required String email, required String code}) async {
    final authResponse = await _remoteDataSource.verifyOtp(
      email: email,
      code: code,
    );

    // Extract tokens and user from response
    final tokens = authResponse.tokens.toDomain();
    final user = authResponse.user.toDomain();

    // Store authentication data using AuthManager
    await _authManager.storeAuthData(user: user, tokens: tokens);

    return user;
  }
}
