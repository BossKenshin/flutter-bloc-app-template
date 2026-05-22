import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_cached_user.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/logout_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required GetCachedUser getCachedUser,
    required LoginUser loginUser,
    required LogoutUser logoutUser,
  }) : _getCachedUser = getCachedUser,
       _loginUser = loginUser,
       _logoutUser = logoutUser,
       super(const AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LogoutRequested>(_onLogoutRequested);
  }

  final GetCachedUser _getCachedUser;
  final LoginUser _loginUser;
  final LogoutUser _logoutUser;

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final user = await _getCachedUser();
    emit(user == null ? const Unauthenticated() : Authenticated(user));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final user = await _loginUser(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(user));
    } catch (error) {
      emit(AuthFailure(error.toString()));
      emit(const Unauthenticated());
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _logoutUser();
    emit(const Unauthenticated());
  }
}
