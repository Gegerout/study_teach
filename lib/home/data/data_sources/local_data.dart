import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:study_teach/home/data/models/user_model.dart';

class LocalData {
  Future<UserModel?> loadUser() async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/userData.json");
    if(file.existsSync()) {
      final model = UserModel.fromJson(json.decode(file.readAsStringSync()));
      return model;
    }
    return null;
  }

  Future<void> saveUserAvatar(String path) async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/userAvatar.json");
    file.writeAsStringSync(json.encode(path));
  }

  Future<String?> loadUserAvatar() async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/userAvatar.json");
    if(file.existsSync()) {
      return json.decode(file.readAsStringSync());
    }
    return null;
  }
}