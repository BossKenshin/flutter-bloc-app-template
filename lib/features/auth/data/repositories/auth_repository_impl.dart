import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._localDataSource);

  final AuthLocalDataSource _localDataSource;

  @override
  Future<AuthUser?> getCachedUser() async {
    return _localDataSource.getCachedUser();
  }

  @override
  Future<AuthUser> login({required String email, required String password}) {
    return _localDataSource.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return _localDataSource.logout();
  }
}
