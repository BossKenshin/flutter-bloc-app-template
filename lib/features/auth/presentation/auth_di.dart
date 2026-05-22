import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasources/auth_local_datasource.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/get_cached_user.dart';
import '../domain/usecases/login_user.dart';
import '../domain/usecases/logout_user.dart';
import 'bloc/auth_bloc.dart';

Future<void> initAuth(GetIt sl) async {
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthLocalDataSource>()),
  );
  sl.registerLazySingleton(() => GetCachedUser(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LoginUser(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUser(sl<AuthRepository>()));
  sl.registerFactory(
    () => AuthBloc(
      getCachedUser: sl<GetCachedUser>(),
      loginUser: sl<LoginUser>(),
      logoutUser: sl<LogoutUser>(),
    ),
  );
}
