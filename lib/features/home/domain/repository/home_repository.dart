import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/data/model/restaurants.dart';
import 'package:nawel/features/home/data/model/services.dart';
import 'package:nawel/features/home/data/model/shortcuts.dart';


abstract interface class HomeRepository {
  Future<Either<String, List<ServicesModel>>> fetchServices();

  Future<Either<String, List<PromotionsModel>>> fetchPromotions();

  Future<Either<String, List<RestaurantsModel>>> fetchRestaurants();

  Future<Either<String, List<ShortcutsModel>>> fetchShortcuts();

}
