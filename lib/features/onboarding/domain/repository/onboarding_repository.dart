import 'package:dartz/dartz.dart';

abstract interface class OnboardingRepository {

  Future<Either<String, String>> completeOnboarding();

  void close();
}