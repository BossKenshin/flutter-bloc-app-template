import 'dart:developer' as dev;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/bloc/bloc_providers.dart';
import 'core/helpers/injection_container.dart';
import 'core/routes/app_router.dart';
import 'core/routes/route_observer.dart';
import 'core/themes/app_theme.dart';
import 'core/widgets/fallback_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    dev.log(
      'Unhandled platform error',
      error: error,
      stackTrace: stack,
      name: 'flutter_bloc_app_template.main',
    );
    return true;
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorFallbackPage(message: details.exceptionAsString());
  };

  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    dev.log('No .env file found. Using packaged example defaults.');
    await dotenv.load(fileName: '.env.example');
  }

  await init();

  runApp(const TemplateApp());
}

class TemplateApp extends StatelessWidget {
  const TemplateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocProviders(
      child: MaterialApp(
        title: 'Flutter BLoC Template',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/',
        navigatorObservers: [routeObserver],
      ),
    );
  }
}
