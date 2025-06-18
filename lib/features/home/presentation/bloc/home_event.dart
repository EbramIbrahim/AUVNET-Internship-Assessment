import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeFeaturesEvent extends HomeEvent {}

class LoadServicesEvent extends HomeEvent {}

class LoadShortcutsEvent extends HomeEvent {}

class LoadPromotionsEvent extends HomeEvent {}

class LoadRestaurantsEvent extends HomeEvent {}
