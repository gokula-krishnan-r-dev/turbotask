import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/auth/domain/entities/user.dart';

part 'auth_state_event.freezed.dart';

/// Events for global auth state management
@freezed
class AuthStateEvent with _$AuthStateEvent {
  const factory AuthStateEvent.authStateChanged({
    required bool isAuthenticated,
    User? user,
  }) = _AuthStateChanged;

  const factory AuthStateEvent.userUpdated({required User user}) = _UserUpdated;

  const factory AuthStateEvent.logout() = _Logout;
}
