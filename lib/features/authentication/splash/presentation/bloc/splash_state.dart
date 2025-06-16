import 'package:equatable/equatable.dart';

enum SplashStatus { authenticated, unAuthenticated }

class SplashState extends Equatable {
  final SplashStatus? splashStatus;

  const SplashState({required this.splashStatus});

  SplashState copyWith({SplashStatus? splashStatus}) {
    return SplashState(splashStatus: splashStatus);
  }

  @override
  List<Object?> get props => [splashStatus];
}
