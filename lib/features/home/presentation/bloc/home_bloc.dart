
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:nawel/features/home/domain/repository/home_repository.dart';
import 'package:nawel/features/home/presentation/bloc/home_event.dart';
import 'package:nawel/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc({required HomeRepository homeRepository})
    : _homeRepository = homeRepository,
      super(HomeState(homeStatus: HomeStatus.initial)) {
    on<HomeFeaturesEvent>(_onLoadAllData);
    on<LoadServicesEvent>(_onLoadServices);
    on<LoadShortcutsEvent>(_onLoadShortcuts);
    on<LoadPromotionsEvent>(_onLoadPromotions);
    on<LoadRestaurantsEvent>(_onLoadRestaurants);
  }

  Future<void> _onLoadAllData(
    HomeFeaturesEvent event,
    Emitter<HomeState> emit,
  ) async {
  }

  Future<void> _onLoadServices(
    LoadServicesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));

    final result = await _homeRepository.fetchServices();
    result.fold(
      (l) =>
          emit(state.copyWith(homeStatus: HomeStatus.failure, errorMessage: l)),
      (r) => emit(
        state.copyWith(homeStatus: HomeStatus.success, servicesModel: r),
      ),
    );
    log(state.servicesModel.toString());
  }

  Future<void> _onLoadShortcuts(
    LoadShortcutsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));

    final result = await _homeRepository.fetchShortcuts();
    result.fold(
      (l) =>
          emit(state.copyWith(homeStatus: HomeStatus.failure, errorMessage: l)),
      (r) => emit(
        state.copyWith(homeStatus: HomeStatus.success, shortcutsModel: r),
      ),
    );
    log(state.shortcutsModel.toString());

  }

  Future<void> _onLoadPromotions(
    LoadPromotionsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));

    final result = await _homeRepository.fetchPromotions();
    result.fold(
      (l) =>
          emit(state.copyWith(homeStatus: HomeStatus.failure, errorMessage: l)),
      (r) => emit(
        state.copyWith(homeStatus: HomeStatus.success, promotionsModel: r),
      ),
    );
    log(state.promotionsModel.toString());

  }

  Future<void> _onLoadRestaurants(
    LoadRestaurantsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));

    final result = await _homeRepository.fetchRestaurants();
    result.fold(
      (l) =>
          emit(state.copyWith(homeStatus: HomeStatus.failure, errorMessage: l)),
      (r) => emit(
        state.copyWith(homeStatus: HomeStatus.success, restaurantsModel: r),
      ),
    );
    log(state.restaurantsModel.toString());

  }
}
