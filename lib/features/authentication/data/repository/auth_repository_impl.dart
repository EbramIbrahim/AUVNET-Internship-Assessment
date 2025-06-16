import 'package:dartz/dartz.dart';
import 'package:nawel/features/authentication/domain/remote_data_source/auth_remote_data_source.dart';
import 'package:nawel/features/authentication/domain/repository/auth_repository.dart';

import '../../../../core/exception/exception_handeling.dart';
import '../../../../core/exception/faliure.dart';

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
  Future<Either<Faliure, String>> signUp({
    required String email,
    required String password,
  }) async {
    return await executeTryAndCatchForRepository(() async {
      await _authRemoteDataSource.signUp(email: email, password: password);
      return "SignUp Successfully";
    });
  }

  @override
  Future<Either<Faliure, bool>> checkUserAuthenticated() async {
    return await executeTryAndCatchForRepository(() async {
       final isAuthenticated = await _authRemoteDataSource.checkUserAuthenticated();
      return isAuthenticated;
    });

  }
}
