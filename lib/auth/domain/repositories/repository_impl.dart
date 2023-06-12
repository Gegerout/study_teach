import 'package:study_teach/auth/domain/usecases/user_usecase.dart';

abstract class Repository {
  Future<UserUseCase> createUser(UserUseCase user);
  Future<UserUseCase> loginUser(UserUseCase user);
}