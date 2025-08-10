import 'package:injectable/injectable.dart';

import '../../../../core/network/api_service.dart';
import '../models/auth_response_model.dart';
import '../models/auth_tokens_model.dart';
import '../models/user_model.dart';

/// Abstract definition of auth remote data source
abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> register({
    required String email,
    required String password,
    required String name,
  });

  Future<void> logout();

  Future<UserModel> getCurrentUser();

  Future<AuthTokensModel> refreshTokens();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });

  Future<void> verifyEmail(String token);

  Future<void> resendEmailVerification();

  Future<UserModel> updateProfile({String? name, String? avatarUrl});

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<void> deleteAccount();

  /// Initiate OTP by sending code to email
  Future<void> initiateOtp(String email);

  /// Verify OTP code and get complete auth response
  Future<AuthResponseModel> verifyOtp({
    required String email,
    required String code,
  });
}

/// Implementation of auth remote data source using ApiService
@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiService.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AuthResponseModel> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await _apiService.post(
      '/auth/register',
      data: {'email': email, 'password': password, 'name': name},
    );

    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> logout() async {
    await _apiService.post('/auth/logout');
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await _apiService.get('/auth/me');
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AuthTokensModel> refreshTokens() async {
    final response = await _apiService.post('/auth/refresh');
    return AuthTokensModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _apiService.post('/auth/password/forgot', data: {'email': email});
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    await _apiService.post(
      '/auth/password/reset',
      data: {'token': token, 'password': newPassword},
    );
  }

  @override
  Future<void> verifyEmail(String token) async {
    await _apiService.post('/auth/email/verify', data: {'token': token});
  }

  @override
  Future<void> resendEmailVerification() async {
    await _apiService.post('/auth/email/resend');
  }

  @override
  Future<UserModel> updateProfile({String? name, String? avatarUrl}) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (avatarUrl != null) data['avatar_url'] = avatarUrl;

    final response = await _apiService.patch('/auth/profile', data: data);
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await _apiService.patch(
      '/auth/password',
      data: {'current_password': currentPassword, 'new_password': newPassword},
    );
  }

  @override
  Future<void> deleteAccount() async {
    await _apiService.delete('/auth/account');
  }

  @override
  Future<void> initiateOtp(String email) async {
    await _apiService.post(
      '/api/v1/auth/login/initiate',
      data: {'email': email},
    );
  }

  @override
  Future<AuthResponseModel> verifyOtp({
    required String email,
    required String code,
  }) async {
    final response = await _apiService.post(
      '/api/v1/auth/login/verify',
      data: {'email': email, 'code': code},
    );

    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
