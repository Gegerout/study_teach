import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:study_teach/auth/data/models/user_model.dart';

class LocalData {
  Future<UserModel> createUser(UserModel user) async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/userData.json");
    file.writeAsStringSync(json.encode(user), flush: true, mode: FileMode.write);
    return user;
  }

  Future<UserModel> loginUser(UserModel user) async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/userData.json");
    file.writeAsStringSync(json.encode(user), flush: true, mode: FileMode.write);
    return user;
  }
}