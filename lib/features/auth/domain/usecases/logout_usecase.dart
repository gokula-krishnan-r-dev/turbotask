import 'package:injectable/injectable.dart';

import '../repositories/auth_repository.dart';

/// Use case for user logout operation.
/// Handles clearing tokens and session cleanup.
@injectable
class LogoutUseCase {
  const LogoutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  /// Execute logout operation
  /// Clears all stored authentication data
  Future<void> call() async {
    await _authRepository.logout();
  }
}
