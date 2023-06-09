import '../usecases/onboarding_usecase.dart';

abstract class Repository {
  Future<OnboardingUseCase> loadData();
}