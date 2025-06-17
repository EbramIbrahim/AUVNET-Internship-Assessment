import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawel/core/constant/firebase_utils.dart';
import 'package:nawel/core/exception/exception_handeling.dart';

import '../../domain/remote_service/home_remote_services.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore _fireStore;

  HomeRemoteDataSourceImpl({required FirebaseFirestore firebaseFirestore})
    : _fireStore = firebaseFirestore;

  @override
  Future<List<Map<String, dynamic>>> fetchPromotions() async {
    return executeTryAndCatchForDataLayer(() async {
      List<Map<String, dynamic>> list = [];
      await _fireStore.collection(FirebaseUtils.promotionCollection).get().then(
        (res) {
          log(res.docs.toString());
          for (var element in res.docs) {
            list.add(element.data());
          }
        },
      );
      return list;
    });
  }

  @override
  Future<List<Map<String, dynamic>>> fetchRestaurants() async {
    return executeTryAndCatchForDataLayer(() async {
      List<Map<String, dynamic>> list = [];
      await _fireStore.collection(FirebaseUtils.restaurantCollection).get().then(
            (res) {
          log(res.docs.toString());
          for (var element in res.docs) {
            list.add(element.data());
          }
        },
      );
      return list;
    });
  }

  @override
  Future<List<Map<String, dynamic>>> fetchShortcuts() async {
    return executeTryAndCatchForDataLayer(() async {
      List<Map<String, dynamic>> list = [];
      await _fireStore.collection(FirebaseUtils.shortcutsCollection).get().then(
            (res) {
          log(res.docs.toString());
          for (var element in res.docs) {
            list.add(element.data());
          }
        },
      );
      return list;
    });
  }

  @override
  Future<List<Map<String, dynamic>>> fetchServices() async {
    return executeTryAndCatchForDataLayer(() async {
      List<Map<String, dynamic>> list = [];
      await _fireStore.collection(FirebaseUtils.serviceCollection).get().then(
            (res) {
          log(res.docs.toString());
          for (var element in res.docs) {
            list.add(element.data());
          }
        },
      );
      return list;
    });
  }
}
