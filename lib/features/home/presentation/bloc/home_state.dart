import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus? homeStatus;
  final String? errorMessage;
  final dynamic data;

  const HomeState({required this.homeStatus, this.errorMessage, this.data});

  HomeState copyWith({
    HomeStatus? homeStatus,
    String? errorMessage,
    dynamic data,
  }) {
    return HomeState(
      homeStatus: homeStatus,
      errorMessage: errorMessage,
      data: data,
    );
  }

  @override
  List<Object?> get props => [homeStatus];
}
