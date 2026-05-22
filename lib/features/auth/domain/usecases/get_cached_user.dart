import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

class GetCachedUser {
  const GetCachedUser(this._repository);

  final AuthRepository _repository;

  Future<AuthUser?> call() {
    return _repository.getCachedUser();
  }
}
