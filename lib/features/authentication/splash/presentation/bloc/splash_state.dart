import 'package:equatable/equatable.dart';

enum SplashStatus { isFirstTime, authenticated, unAuthenticated, failure }

class SplashState extends Equatable {
  final SplashStatus? splashStatus;
  final String? errorMessage;

  const SplashState({required this.splashStatus, this.errorMessage});

  SplashState copyWith({SplashStatus? splashStatus, String? message}) {
    return SplashState(splashStatus: splashStatus, errorMessage: message);
  }

  @override
  List<Object?> get props => [splashStatus];
}
