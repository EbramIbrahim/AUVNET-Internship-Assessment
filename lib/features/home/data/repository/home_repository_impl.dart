import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:nawel/core/helpers/connection_helper.dart';
import 'package:nawel/features/home/data/local_service/home_local_data_source_impl.dart';
import 'package:nawel/features/home/data/model/promotions.dart';
import 'package:nawel/features/home/data/model/restaurants.dart';
import 'package:nawel/features/home/data/model/services.dart';
import 'package:nawel/features/home/data/model/shortcuts.dart';
import 'package:nawel/features/home/domain/remote_service/home_remote_services.dart';

import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _homeRemoteService;
  final HomeLocalDataSourceImpl _homeLocalDataSourceImpl;
  final InternetConnectionHelper _connectionHelper;

  HomeRepositoryImpl({
    required HomeRemoteDataSource homeRemoteService,
    required HomeLocalDataSourceImpl homeLocalDataSourceImpl,
    required InternetConnectionHelper connectionHelper,
  }) : _homeRemoteService = homeRemoteService,
       _homeLocalDataSourceImpl = homeLocalDataSourceImpl,
       _connectionHelper = connectionHelper;

  @override
  Future<Either<String, List<RestaurantsModel>>> fetchRestaurants() async {
    final bool isDataBaseEmpty =
        await _homeLocalDataSourceImpl.isDataAvailable();
    final bool isInternetConnected =
        await _connectionHelper.checkInternetConnection();
    log("is Data Empty:$isDataBaseEmpty");

    if (isInternetConnected) {
      try {
        await _homeLocalDataSourceImpl.clearRestaurantsModel();
        final result = await _homeRemoteService.fetchRestaurants();
        List<RestaurantsModel> remoteRestaurant = [];
        for (var element in result) {
          remoteRestaurant.add(RestaurantsModel.fromJson(element));
        }
        await _homeLocalDataSourceImpl.insertRestaurants(
          restaurants: remoteRestaurant,
        );
        List<RestaurantsModel> localRestaurant =
            await _homeLocalDataSourceImpl.getRestaurants();
        log("local restaurants ${localRestaurant.toString()}");

        return Right(localRestaurant);
      } catch (e) {
        if (!isDataBaseEmpty) {
           List<RestaurantsModel> localRestaurant =
              await _homeLocalDataSourceImpl.getRestaurants();

          return Right(localRestaurant);
        } else {
          return const Left("Unexpected error happened!");
        }
      }
    } else {
      if (!isDataBaseEmpty) {
         List<RestaurantsModel> localRestaurant =
            await _homeLocalDataSourceImpl.getRestaurants();

        return Right(localRestaurant);
      } else {
        return const Left("No Network connection!");
      }
    }
  }

  @override
  Future<Either<String, List<PromotionsModel>>> fetchPromotions() async {
    final bool isDataBaseEmpty =
        await _homeLocalDataSourceImpl.isDataAvailable();
    final bool isInternetConnected =
        await _connectionHelper.checkInternetConnection();
    log("is Data Empty:$isDataBaseEmpty");

    if (isInternetConnected) {
      try {
        await _homeLocalDataSourceImpl.clearPromotionModel();
        final result = await _homeRemoteService.fetchPromotions();
        List<PromotionsModel> promotions = [];
        for (var element in result) {
          promotions.add(PromotionsModel.fromJson(element));
        }
        await _homeLocalDataSourceImpl.insertPromotions(promotions: promotions);
        List<PromotionsModel> localPromotions =
            await _homeLocalDataSourceImpl.getPromotions();
        log("local Promotions ${localPromotions.toString()}");

        return Right(localPromotions);
      } catch (e) {
        if (!isDataBaseEmpty) {
           List<PromotionsModel> localPromotions =
              await _homeLocalDataSourceImpl.getPromotions();

          return Right(localPromotions);
        } else {
          return const Left("Unexpected error happened!");
        }
      }
    } else {
      if (!isDataBaseEmpty) {
         List<PromotionsModel> localPromotions =
            await _homeLocalDataSourceImpl.getPromotions();

        return Right(localPromotions);
      } else {
        return const Left("No Network connection!");
      }
    }
  }

  @override
  Future<Either<String, List<ServicesModel>>> fetchServices() async {
    final bool isDataBaseEmpty =
        await _homeLocalDataSourceImpl.isDataAvailable();
    final bool isInternetConnected =
        await _connectionHelper.checkInternetConnection();
    log("is Data Empty:$isDataBaseEmpty");

    if (isInternetConnected) {
      try {
        await _homeLocalDataSourceImpl.clearServicesModel();
        final result = await _homeRemoteService.fetchServices();
        List<ServicesModel> remoteServices = [];
        for (var element in result) {
          remoteServices.add(ServicesModel.fromJson(element));
        }
        await _homeLocalDataSourceImpl.insertServices(services: remoteServices);
        List<ServicesModel> localServices =
            await _homeLocalDataSourceImpl.getServices();
        log("local services ${localServices.toString()}");

        return Right(localServices);
      } catch (e) {
        if (!isDataBaseEmpty) {
           List<ServicesModel> localServices =
              await _homeLocalDataSourceImpl.getServices();

          return Right(localServices);
        } else {
          return const Left("Unexpected error happened!");
        }
      }
    } else {
      if (!isDataBaseEmpty) {
         List<ServicesModel> localServices =
            await _homeLocalDataSourceImpl.getServices();

        return Right(localServices);
      } else {
        return const Left("No Network connection!");
      }
    }
  }

  @override
  Future<Either<String, List<ShortcutsModel>>> fetchShortcuts() async {
    final bool isDataBaseEmpty =
        await _homeLocalDataSourceImpl.isDataAvailable();
    final bool isInternetConnected =
        await _connectionHelper.checkInternetConnection();
    log("is Data Empty:$isDataBaseEmpty");

    if (isInternetConnected) {
      try {
        await _homeLocalDataSourceImpl.clearShortcutsModel();
        final result = await _homeRemoteService.fetchShortcuts();
        List<ShortcutsModel> shortcuts = [];
        for (var element in result) {
          shortcuts.add(ShortcutsModel.fromJson(element));
        }
        await _homeLocalDataSourceImpl.insertShortcuts(shortcuts: shortcuts);
        List<ShortcutsModel> localShortcuts =
            await _homeLocalDataSourceImpl.getShortcuts();
        log("local shortcuts ${localShortcuts.toString()}");

        return Right(localShortcuts);
      } catch (e) {
        if (!isDataBaseEmpty) {
          log('Load [shortcuts] from Local DataBase');
           List<ShortcutsModel> localShortcuts =
              await _homeLocalDataSourceImpl.getShortcuts();
          log("local shortcuts ${localShortcuts.toString()}");

          return Right(localShortcuts);
        } else {
          return const Left("Unexpected error happened!");
        }
      }
    } else {
      if (!isDataBaseEmpty) {
        log('Load [shortcuts] from Local DataBase');
         List<ShortcutsModel> localShortcuts =
            await _homeLocalDataSourceImpl.getShortcuts();
        log("local shortcuts ${localShortcuts.toString()}");

        return Right(localShortcuts);
      } else {
        return const Left("No Network connection!");
      }
    }
  }

}
