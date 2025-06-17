import 'package:dartz/dartz.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/data/model/restaurants.dart';
import 'package:nawel/features/home/data/model/services.dart';
import 'package:nawel/features/home/data/model/shortcuts.dart';

import '../../../../core/exception/faliure.dart';

abstract interface class HomeRepository {
  Future<Either<Faliure, List<ServicesModel>>> fetchServices();

  Future<Either<Faliure, List<ShortcutsModel>>> fetchShortcuts();

  Future<Either<Faliure, List<PromotionsModel>>> fetchPromotions();

  Future<Either<Faliure, List<RestaurantsModel>>> fetchRestaurants();
}
