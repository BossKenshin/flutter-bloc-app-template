import 'package:flutter/material.dart';

import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/splash_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../widgets/fallback_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashView());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundFallbackPage());
    }
  }
}
