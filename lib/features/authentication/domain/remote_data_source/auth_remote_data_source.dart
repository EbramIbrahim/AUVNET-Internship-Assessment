import 'package:firebase_auth/firebase_auth.dart';

import '../../data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {

  Future<UserCredential> signUp({
    required String email,
    required String password,
  });

  Future<UserCredential> signIn({
    required String email,
    required String password,
  });

  Future<bool> checkUserAuthenticated();
}