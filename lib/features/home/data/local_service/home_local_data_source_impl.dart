import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:nawel/core/constant/db_keys.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/data/model/restaurants.dart';
import 'package:nawel/features/home/data/model/services.dart';
import 'package:nawel/features/home/data/model/shortcuts.dart';

class HomeLocalDataSourceImpl {
  /// Box Key
  static const String _servicesKey = DbKeys.servicesKey;
  static const String _shortcutKey = DbKeys.shortcutKey;
  static const String _promotionKey = DbKeys.promotionKey;
  static const String _restaurantKey = DbKeys.restaurantKey;

  /// Products Box
  static Box<ServicesModel>? _servicesBox;
  static Box<ShortcutsModel>? _shortcutBox;
  static Box<PromotionsModel>? _promotionBox;
  static Box<RestaurantsModel>? _restaurantBox;

  HomeLocalDataSourceImpl();

  Future<void> initDataBase() async {
    try {
      Hive.registerAdapter(ServicesModelAdapter());
      Hive.registerAdapter(ShortcutsModelAdapter());
      Hive.registerAdapter(PromotionsModelAdapter());
      Hive.registerAdapter(RestaurantsModelAdapter());

      _servicesBox = await Hive.openBox<ServicesModel>(_servicesKey);
      _shortcutBox = await Hive.openBox<ShortcutsModel>(_shortcutKey);
      _promotionBox = await Hive.openBox<PromotionsModel>(_promotionKey);
      _restaurantBox = await Hive.openBox<RestaurantsModel>(_restaurantKey);

      log('Success on initializing database');
    } catch (e) {
      // Handle initialization errors
      log('Error initializing database');
    }
  }

  // insert methods
  Future<void> insertServices({required List<ServicesModel> services}) async {
    await _servicesBox!.addAll(services);
  }

  Future<void> insertShortcuts({
    required List<ShortcutsModel> shortcuts,
  }) async {
    await _shortcutBox!.addAll(shortcuts);
  }

  Future<void> insertPromotions({
    required List<PromotionsModel> promotions,
  }) async {
    await _promotionBox!.addAll(promotions);

  }

  Future<void> insertRestaurants({
    required List<RestaurantsModel> restaurants,
  }) async {
    await _restaurantBox!.addAll(restaurants);

  }

  // get methods

  Future<List<ServicesModel>> getServices() async {
    final box = Hive.box<ServicesModel>(_servicesKey);
    return box.values.toList();
  }

  Future<List<ShortcutsModel>> getShortcuts() async {
    final box = Hive.box<ShortcutsModel>(_shortcutKey);
    return box.values.toList();
  }

  Future<List<PromotionsModel>> getPromotions() async {
    final box = await Hive.openBox<PromotionsModel>(_promotionKey);
    return box.values.toList();
  }

  Future<List<RestaurantsModel>> getRestaurants() async {
    final box = Hive.box<RestaurantsModel>(_restaurantKey);
    return box.values.toList();
  }

  Future<bool> isDataAvailable() async {
    try {
      return _shortcutBox!.isEmpty;
    } catch (e) {
      // Handle error checking box emptiness
      log('Error checking if box is empty: $e');
      return true; // Return true assuming it's empty on error
    }
  }
}
