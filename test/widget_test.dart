import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_bloc_app_template/core/helpers/injection_container.dart';
import 'package:flutter_bloc_app_template/main.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await sl.reset();
    await init();
  });

  testWidgets('shows login then opens dashboard with demo credentials', (
    tester,
  ) async {
    await tester.pumpWidget(const TemplateApp());
    await tester.pumpAndSettle();

    expect(find.text('Flutter BLoC Template'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.textContaining('Welcome'), findsOneWidget);
    expect(find.text('BLoC'), findsOneWidget);
  });
}
