import 'package:dartz/dartz.dart';

import '../../../../core/exception/faliure.dart';

abstract interface class AuthRepository {

  Future<Either<Faliure, String>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Faliure, String>> signUp({
    required String email,
    required String password,
  });

  Future<Either<Faliure, bool>> checkUserAuthenticated();

  Future<Either<String, bool>> isFirstTime();



}