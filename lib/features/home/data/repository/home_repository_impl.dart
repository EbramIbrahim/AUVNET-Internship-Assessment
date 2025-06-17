import 'dart:developer';

import 'package:nawel/core/exception/exception_handeling.dart';
import 'package:nawel/features/home/domain/remote_service/home_remote_services.dart';

import '../../domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/data/model/restaurants.dart';
import 'package:nawel/features/home/data/model/services.dart';
import 'package:nawel/features/home/data/model/shortcuts.dart';

import '../../../../core/exception/faliure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteService;

  HomeRepositoryImpl({required HomeRemoteDataSource homeRemoteService})
    : _homeRemoteService = homeRemoteService;

  @override
  Future<Either<Faliure, List<RestaurantsModel>>> fetchRestaurants() async {
    return executeTryAndCatchForRepository(() async {
      final result = await _homeRemoteService.fetchRestaurants();
      List<RestaurantsModel> restaurants = [];
      for (var element in result) {
        restaurants.add(
          RestaurantsModel.fromJson(element),
        );
      }
      return restaurants;
    });
  }

  @override
  Future<Either<Faliure, List<PromotionsModel>>> fetchPromotions() async {
    return executeTryAndCatchForRepository(() async {
      final result = await _homeRemoteService.fetchPromotions();
      List<PromotionsModel> promotions = [];
      for (var element in result) {
        promotions.add(
          PromotionsModel.fromJson(element),
        );
      }
      return promotions;
    });
  }

  @override
  Future<Either<Faliure, List<ShortcutsModel>>> fetchShortcuts() async {
    return executeTryAndCatchForRepository(() async {
      final result = await _homeRemoteService.fetchShortcuts();
      List<ShortcutsModel> shortcuts = [];
      for (var element in result) {
        shortcuts.add(
          ShortcutsModel.fromJson(element),
        );
      }
      return shortcuts;
    });
  }

  @override
  Future<Either<Faliure, List<ServicesModel>>> fetchServices() async {
    return executeTryAndCatchForRepository(() async {
      final result = await _homeRemoteService.fetchServices();
      List<ServicesModel> services = [];
      for (var element in result) {
        log(element.toString());
        services.add(
          ServicesModel.fromJson(element),
        );
      }
      return services;
    });
  }
}
