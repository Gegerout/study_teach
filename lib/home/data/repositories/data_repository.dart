import 'package:study_teach/home/data/data_sources/local_data.dart';
import 'package:study_teach/home/domain/repositories/repository_impl.dart';
import 'package:study_teach/home/domain/usecases/user_usecase.dart';

class DataRepository extends Repository {
  @override
  Future<UserUseCase?> loadUser() async {
    final data = await LocalData().loadUser();
    if(data != null) {
      final usecase = UserUseCase(data.name, data.phone, data.email);
      return usecase;
    }
    return null;
  }

  @override
  Future<void> saveAvatar(String path) async {
    await LocalData().saveUserAvatar(path);
  }

  @override
  Future<String?> loadAvatar() async {
    final path = await LocalData().loadUserAvatar();
    return path;
  }
}