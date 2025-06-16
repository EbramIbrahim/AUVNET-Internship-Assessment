import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/exception/faliure.dart';
import '../../data/model/user_model.dart';

abstract interface class AuthRepository {

  Future<Either<Faliure, String>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Faliure, UserCredential>> signUp({
    required UserModel user
  });

}