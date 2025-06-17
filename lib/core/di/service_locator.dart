import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:nawel/core/services/hive_services.dart';
import 'package:nawel/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:nawel/features/authentication/domain/remote_data_source/auth_remote_data_source.dart';
import 'package:nawel/features/authentication/domain/repository/auth_repository.dart';
import 'package:nawel/features/authentication/signin/presentation/bloc/signin_bloc.dart';
import 'package:nawel/features/home/data/repository/home_repository_impl.dart';
import 'package:nawel/features/home/domain/remote_service/home_remote_services.dart';
import 'package:nawel/features/home/domain/repository/home_repository.dart';
import 'package:nawel/features/home/presentation/bloc/home_bloc.dart';
import 'package:nawel/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:nawel/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:nawel/features/onboarding/presentation/bloc/onboarding_bloc.dart';

import '../../features/authentication/data/remote_data_source/auth_remote_data_source_impl.dart';
import '../../features/authentication/signup/presentation/bloc/signup_bloc.dart';
import '../../features/authentication/splash/presentation/bloc/splash_bloc.dart';
import '../../features/home/data/remote_service/home_remote_services_impl.dart';
import '../services/firestore_services.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // remote data source
  sl.registerLazySingleton(() => FirestoreService());
  sl.registerLazySingleton(() => HiveService());
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(firebaseFirestore: sl()),
  );

  // repos
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl(), hiveService: sl()),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(hiveService: sl()),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteService: sl()),
  );

  // Bloc
  sl.registerFactory(() => SignInBloc(authRepository: sl()));
  sl.registerFactory(() => SignUpBloc(authRepository: sl()));
  sl.registerFactory(() => SplashBloc(authRepository: sl()));
  sl.registerFactory(() => OnboardingBloc(onboardingRepository: sl()));
  sl.registerFactory(() => HomeBloc(homeRepository: sl()));
}
