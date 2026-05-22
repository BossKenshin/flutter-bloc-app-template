import 'package:get_it/get_it.dart';

import '../data/datasources/dashboard_local_datasource.dart';
import '../data/repositories/dashboard_repository_impl.dart';
import '../domain/repositories/dashboard_repository.dart';
import '../domain/usecases/get_dashboard_items.dart';
import 'bloc/home_bloc.dart';

Future<void> initHome(GetIt sl) async {
  sl.registerLazySingleton<DashboardLocalDataSource>(
    DashboardLocalDataSource.new,
  );
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(sl<DashboardLocalDataSource>()),
  );
  sl.registerLazySingleton(() => GetDashboardItems(sl<DashboardRepository>()));
  sl.registerFactory(
    () => HomeBloc(getDashboardItems: sl<GetDashboardItems>()),
  );
}
