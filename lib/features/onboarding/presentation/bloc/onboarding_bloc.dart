import 'package:bloc/bloc.dart';
import 'package:nawel/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:nawel/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:nawel/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository _onboardingRepository;

  OnboardingBloc({required OnboardingRepository onboardingRepository})
    : _onboardingRepository = onboardingRepository,
      super(OnboardingState(onboardingStatus: OnboardingStatus.initial)) {
    on<CompleteOnboarding>((event, emit) async {
      emit(state.copyWith(onboardingStatus: OnboardingStatus.loading));
      final result = await _onboardingRepository.completeOnboarding();
      result.fold(
        (l) => emit(
          state.copyWith(
            onboardingStatus: OnboardingStatus.failure,
            message: l,
          ),
        ),
        (r) => emit(
          state.copyWith(
            onboardingStatus: OnboardingStatus.success,
            message: r,
          ),
        ),
      );
    });
  }
}
