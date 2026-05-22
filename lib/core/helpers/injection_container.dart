import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/presentation/auth_di.dart';
import '../../features/home/presentation/home_di.dart';
import '../../services/api_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<ApiService>(() => ApiService());

  await initAuth(sl);
  await initHome(sl);
}
