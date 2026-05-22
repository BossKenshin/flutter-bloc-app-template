import '../../domain/entities/dashboard_item.dart';

class DashboardLocalDataSource {
  Future<List<DashboardItem>> getDashboardItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));

    return const [
      DashboardItem(
        label: 'Architecture',
        value: 'BLoC',
        description: 'Feature-first folders with clean dependency boundaries.',
      ),
      DashboardItem(
        label: 'Services',
        value: 'GetIt',
        description: 'One composition root wires repositories and BLoCs.',
      ),
      DashboardItem(
        label: 'Config',
        value: '.env',
        description: 'Environment values are loaded before app startup.',
      ),
    ];
  }
}
