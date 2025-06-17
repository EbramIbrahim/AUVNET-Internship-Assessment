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
    on<HomeFeaturesEvent>((event, emit) async {
      emit(state.copyWith(homeStatus: HomeStatus.loading));
      final promotions = await _homeRepository.fetchPromotions();
      promotions.fold(
        (l) => emit(
          state.copyWith(homeStatus: HomeStatus.failure, errorMessage: l.erorr),
        ),
        (r) {
          emit(state.copyWith(homeStatus: HomeStatus.success, data: r));
          log(r.toString());
        }
      );
      log(state.data.toString());
      log(state.homeStatus.toString());

    });
  }
}

