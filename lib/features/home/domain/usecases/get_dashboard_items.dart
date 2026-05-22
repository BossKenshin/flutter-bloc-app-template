import '../entities/dashboard_item.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardItems {
  const GetDashboardItems(this._repository);

  final DashboardRepository _repository;

  Future<List<DashboardItem>> call() {
    return _repository.getDashboardItems();
  }
}
