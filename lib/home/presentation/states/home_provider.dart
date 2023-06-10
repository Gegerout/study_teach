import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_teach/home/data/repositories/data_repository.dart';
import 'package:study_teach/home/domain/usecases/user_usecase.dart';

final getUserProvider = FutureProvider<UserUseCase>((ref) async {
  final data = await DataRepository().loadUser();
  return data;
});