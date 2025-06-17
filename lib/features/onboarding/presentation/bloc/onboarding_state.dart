import 'package:equatable/equatable.dart';

enum OnboardingStatus { initial, loading, success, failure }

class OnboardingState extends Equatable {
  final OnboardingStatus? onboardingStatus;
  final String? errorMessage;

  const OnboardingState({required this.onboardingStatus, this.errorMessage});

  OnboardingState copyWith({
    OnboardingStatus? onboardingStatus,
    String? message,
  }) {
    return OnboardingState(
      onboardingStatus: onboardingStatus,
      errorMessage: message,
    );
  }

  @override
  List<Object?> get props => [onboardingStatus];
}
