import 'package:study_teach/auth/data/data_sources/local_data.dart';
import 'package:study_teach/auth/data/models/user_model.dart';
import 'package:study_teach/auth/domain/repositories/repository_impl.dart';
import 'package:study_teach/auth/domain/usecases/user_usecase.dart';

class DataRepository extends Repository {
  @override
  Future<UserUseCase> createUser(UserUseCase user) async {
    final model = UserModel(user.name, user.phone, user.email);
    await LocalData().createUser(model);
    return user;
  }

  @override
  Future<UserUseCase> loginUser(UserUseCase user) async {
    final model = UserModel(user.name, user.phone, user.email);
    await LocalData().loginUser(model);
    return user;
  }

}