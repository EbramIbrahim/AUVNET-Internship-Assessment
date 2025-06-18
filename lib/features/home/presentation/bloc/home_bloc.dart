import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:nawel/core/exception/faliure.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/data/model/restaurants.dart';
import 'package:nawel/features/home/data/model/services.dart';
import 'package:nawel/features/home/data/model/shortcuts.dart';
import 'package:nawel/features/home/domain/repository/home_repository.dart';
import 'package:nawel/features/home/presentation/bloc/home_event.dart';
import 'package:nawel/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc({required HomeRepository homeRepository})
    : _homeRepository = homeRepository,
      super(HomeState(homeStatus: HomeStatus.initial)) {
    on<HomeFeaturesEvent>(_onLoadAllDataSequentially);
  }

  Future<void> _onLoadAllDataSequentially(
    HomeFeaturesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));

      // Execute sequentially
      final servicesEither = await _homeRepository.fetchServices();
      final shortcutsEither = await _homeRepository.fetchShortcuts();
      final promotionsEither = await _homeRepository.fetchPromotions();
      final restaurantsEither = await _homeRepository.fetchRestaurants();

      // Check for failures
      final failures =
          [servicesEither, shortcutsEither, promotionsEither, restaurantsEither]
              .map((either) => either.fold((failure) => failure, (_) => null))
              .whereType<Faliure>()
              .toList();

      if (failures.isNotEmpty) {
        final errorMessage = failures.map((f) => f.erorr).join('\n');
        emit(
          state.copyWith(
            homeStatus: HomeStatus.failure,
            errorMessage: errorMessage,
          ),
        );
      }
      // Convert HiveObjects to Models
      final services = servicesEither.fold(
        (_) => <ServicesModel>[],
        (servicesList) => servicesList,
      );

      final shortcuts = shortcutsEither.fold(
        (_) => <ShortcutsModel>[],
        (shortcutsList) => shortcutsList,
      );

      final promotions = promotionsEither.fold(
        (_) => <PromotionsModel>[],
        (promotionsList) => promotionsList,
      );

      final restaurants = restaurantsEither.fold(
        (_) => <RestaurantsModel>[],
        (restaurantsList) => restaurantsList,
      );


      emit(
        state.copyWith(
          homeStatus: HomeStatus.success,
          servicesModel: services,
          shortcutsModel: shortcuts,
          promotionsModel: promotions,
          restaurantsModel: restaurants,
        ),
      );

    log(state.homeStatus.toString());
  }
}
