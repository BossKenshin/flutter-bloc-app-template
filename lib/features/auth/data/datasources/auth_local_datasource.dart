import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/auth_user.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this._preferences);

  static const _userIdKey = 'auth_user_id';
  static const _userEmailKey = 'auth_user_email';
  static const _userNameKey = 'auth_user_name';

  final SharedPreferences _preferences;

  AuthUser? getCachedUser() {
    final id = _preferences.getString(_userIdKey);
    final email = _preferences.getString(_userEmailKey);
    final name = _preferences.getString(_userNameKey);

    if (id == null || email == null || name == null) return null;

    return AuthUser(id: id, email: email, name: name);
  }

  Future<AuthUser> login({
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));

    if (email.trim() != AppConstants.demoEmail ||
        password != AppConstants.demoPassword) {
      throw const AuthException('Invalid demo credentials');
    }

    const user = AuthUser(
      id: 'demo-user',
      email: AppConstants.demoEmail,
      name: 'Demo User',
    );

    await _preferences.setString(_userIdKey, user.id);
    await _preferences.setString(_userEmailKey, user.email);
    await _preferences.setString(_userNameKey, user.name);

    return user;
  }

  Future<void> logout() async {
    await _preferences.remove(_userIdKey);
    await _preferences.remove(_userEmailKey);
    await _preferences.remove(_userNameKey);
  }
}

class AuthException implements Exception {
  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
