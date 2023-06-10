import 'package:study_teach/auth/domain/usecases/user_usecase.dart';

abstract class Repository {
  Future<void> createUser(UserUseCase user);
  Future<void> loginUser(UserUseCase user);
}