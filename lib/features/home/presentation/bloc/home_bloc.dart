import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_dashboard_items.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required GetDashboardItems getDashboardItems})
    : _getDashboardItems = getDashboardItems,
      super(const HomeInitial()) {
    on<HomeStarted>(_onStarted);
  }

  final GetDashboardItems _getDashboardItems;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(const HomeLoading());

    try {
      final items = await _getDashboardItems();
      emit(HomeLoaded(items));
    } catch (error) {
      emit(HomeFailure(error.toString()));
    }
  }
}
