import 'package:study_teach/onboarding/data/data_sources/local_data.dart';
import 'package:study_teach/onboarding/domain/repositories/repository_impl.dart';
import 'package:study_teach/onboarding/domain/usecases/onboarding_usecase.dart';

class DataRepository extends Repository {
  @override
  Future<OnboardingUseCase> loadData() async {
    final data = await LocalData().loadData();
    final usecase = OnboardingUseCase(data);
    return usecase;
  }

}