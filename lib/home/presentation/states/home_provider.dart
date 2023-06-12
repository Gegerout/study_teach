import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_teach/home/data/repositories/data_repository.dart';
import 'package:study_teach/home/domain/usecases/user_usecase.dart';

final getUserProvider = FutureProvider<UserUseCase?>((ref) async {
  final data = await DataRepository().loadUser();
  return data;
});

final getAvatarProvider = FutureProvider<String?>((ref) async {
  final data = await DataRepository().loadAvatar();
  return data;
});

final gurusProvider = ChangeNotifierProvider((ref) => GurusNotifier());

class GurusNotifier extends ChangeNotifier {
  String gurus = "";
  List subjects = [["kimia", "null"], ["matematika", "Firdaus Riski"], ["fisika", "Muhammad"], ["bahasa inggris", "Anika Rahman"]];

  void selectSubject(String subject) {
    for(int i = 0; i < subjects.length; i++) {
      if(subjects[i][0] == subject) {
        gurus = subjects[i][1];
        break;
      }
    }
    notifyListeners();
  }
}