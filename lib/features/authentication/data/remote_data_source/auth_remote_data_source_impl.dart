import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/exception/exception_handeling.dart';
import '../../../../core/services/firestore_services.dart';
import '../../domain/remote_data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirestoreService _fireStore;

  AuthRemoteDataSourceImpl({required FirestoreService firestore})
    : _fireStore = firestore;

  CollectionReference get _userCollection =>
      _fireStore.firestore.collection("users");

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    return await executeTryAndCatchForDataLayer(() async {
      // Create the user account
      final userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 60));

      if (userCredential.user == null) {
        throw FirebaseAuthException(
          message: "User creation failed",
          code: 'user-not-found',
        );
      }
      return userCredential;
    });
  }

  @override
  Future<bool> checkUserAuthenticated() async {
    return _auth.currentUser != null;
  }

  @override
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await executeTryAndCatchForDataLayer(() async {
      // Create the user account
      final userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 60));

      if (userCredential.user == null) {
        throw FirebaseAuthException(
          message: "User creation failed",
          code: 'user-not-found',
        );
      }

      return userCredential;
    });
  }
}
