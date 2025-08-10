import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/auth/domain/entities/user.dart';

part 'auth_state.freezed.dart';

/// Global authentication state
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.authenticated({required User user}) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.loading() = _Loading;
}

/// Extension to provide convenient state checks
extension AuthStateX on AuthState {
  bool get isAuthenticated => this is _Authenticated;
  bool get isUnauthenticated => this is _Unauthenticated;
  bool get isLoading => this is _Loading;
  bool get isInitial => this is _Initial;

  User? get user => mapOrNull(authenticated: (state) => state.user);
}
