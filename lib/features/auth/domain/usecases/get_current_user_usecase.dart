import 'package:injectable/injectable.dart';

import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Use case for getting current authenticated user.
/// Returns user information if authenticated, null otherwise.
@injectable
class GetCurrentUserUseCase {
  const GetCurrentUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  /// Execute get current user operation
  /// Returns User entity if authenticated, null if not
  Future<User?> call() async {
    return await _authRepository.getCurrentUser();
  }
}
