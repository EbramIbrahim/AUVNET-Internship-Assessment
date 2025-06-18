import 'package:equatable/equatable.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/data/model/restaurants.dart';
import 'package:nawel/features/home/data/model/services.dart';
import 'package:nawel/features/home/data/model/shortcuts.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus? homeStatus;
  final String? errorMessage;
  final List<ServicesModel>? servicesModel;
  final List<ShortcutsModel>? shortcutsModel;
  final List<PromotionsModel>? promotionsModel;
  final List<RestaurantsModel>? restaurantsModel;

  const HomeState({
    required this.homeStatus,
    this.errorMessage,
    this.servicesModel,
    this.restaurantsModel,
    this.promotionsModel,
    this.shortcutsModel,
  });

  HomeState copyWith({
    HomeStatus? homeStatus,
    String? errorMessage,
    List<ServicesModel>? servicesModel,
    List<ShortcutsModel>? shortcutsModel,
    List<PromotionsModel>? promotionsModel,
    List<RestaurantsModel>? restaurantsModel,
  }) {
    return HomeState(
      homeStatus: homeStatus,
      errorMessage: errorMessage,
      servicesModel: servicesModel,
      shortcutsModel: shortcutsModel,
      promotionsModel: promotionsModel,
      restaurantsModel: restaurantsModel,
    );
  }

  @override
  List<Object?> get props => [homeStatus];
}
