import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:nawel/features/authentication/splash/presentation/bloc/splash_event.dart';
import 'package:nawel/features/authentication/splash/presentation/bloc/splash_state.dart';

import '../../../domain/repository/auth_repository.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository _authRepository;
  SplashBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SplashState(splashStatus: SplashStatus.unAuthenticated)) {
    on<SplashEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      final result = await _authRepository.checkUserAuthenticated();
      result.fold(
            (l) => emit(
          state.copyWith(
            splashStatus: SplashStatus.unAuthenticated,
          ),
        ),
            (r) {
              if(r) {
                emit(state.copyWith(splashStatus: SplashStatus.authenticated));
              } else {
                emit(state.copyWith(splashStatus: SplashStatus.unAuthenticated));
              }
            }
      );
      log(state.splashStatus.toString());
    });
  }

}
