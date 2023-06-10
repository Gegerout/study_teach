import 'package:study_teach/home/data/data_sources/local_data.dart';
import 'package:study_teach/home/domain/repositories/repository_impl.dart';
import 'package:study_teach/home/domain/usecases/user_usecase.dart';

class DataRepository extends Repository {
  @override
  Future<UserUseCase> loadUser() async {
    final data = await LocalData().loadUser();
    final usecase = UserUseCase(data.name, data.phone, data.email);
    return usecase;
  }
}