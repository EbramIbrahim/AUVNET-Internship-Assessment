import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/features/authentication/domain/remote_data_source/auth_remote_data_source.dart';
import 'package:nawel/features/authentication/domain/repository/auth_repository.dart';

import '../../../../core/exception/exception_handeling.dart';
import '../../../../core/exception/faliure.dart';
import '../model/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authDataSource})
    : _authRemoteDataSource = authDataSource;

  @override
  Future<Either<Faliure, String>> signIn({
    required String email,
    required String password,
  }) async {
    return await executeTryAndCatchForRepository(() async {
      await _authRemoteDataSource.signIn(email: email, password: password);
      return "Login Successfully";
    });
  }

  @override
  Future<Either<Faliure, UserCredential>> signUp({
    required UserModel user,
  }) async {
    return await executeTryAndCatchForRepository(() async {
      final userCredential = await _authRemoteDataSource.signUp(user: user);
      return userCredential;
    });
  }
}
