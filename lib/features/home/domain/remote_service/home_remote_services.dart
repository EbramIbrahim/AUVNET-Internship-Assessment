import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawel/features/home/data/model/services.dart';
import 'package:nawel/features/home/data/model/shortcuts.dart';

import '../../data/model/promotions.dart';
import '../../data/model/restaurants.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchServices();

  Future<List<Map<String, dynamic>>> fetchShortcuts();

  Future<List<Map<String, dynamic>>> fetchRestaurants();

  Future<List<Map<String, dynamic>>> fetchPromotions();
}
