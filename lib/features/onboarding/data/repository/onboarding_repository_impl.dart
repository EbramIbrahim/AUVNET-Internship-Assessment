import 'package:dartz/dartz.dart';
import 'package:nawel/core/services/hive_services.dart';

import '../../domain/repository/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final HiveService _hiveService;

  OnboardingRepositoryImpl({required HiveService hiveService})
    : _hiveService = hiveService;



  @override
  Future<Either<String, String>> completeOnboarding() async {
    try {
      await _hiveService.completeOnboarding();
      return Right("Welcome");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  void close() async {
    return await _hiveService.close();
  }
}
