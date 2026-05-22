import 'package:equatable/equatable.dart';

class DashboardItem extends Equatable {
  const DashboardItem({
    required this.label,
    required this.value,
    required this.description,
  });

  final String label;
  final String value;
  final String description;

  @override
  List<Object> get props => [label, value, description];
}
