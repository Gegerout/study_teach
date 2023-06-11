import '../usecases/user_usecase.dart';

abstract class Repository {
  Future<UserUseCase?> loadUser();
  Future<void> saveAvatar(String path);
  Future<String?> loadAvatar();
}