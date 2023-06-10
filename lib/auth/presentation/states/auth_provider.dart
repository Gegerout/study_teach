import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_teach/auth/data/repositories/data_repository.dart';
import 'package:study_teach/auth/domain/usecases/user_usecase.dart';

final signupProvider = ChangeNotifierProvider<SignUpNotifier>((ref) => SignUpNotifier());

class SignUpNotifier extends ChangeNotifier {
  bool isName = false;
  bool isPhone = false;
  bool isEmail = false;
  bool isPassword = false;
  bool isChecked = false;

  void checkCreds(String name, String phone, String email, String password) {
    if(name.length > 2) {
      isName = true;
    }
    else {
      isName = false;
    }
    if(RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$").hasMatch(phone)) {
      isPhone = true;
    }
    else {
      isPhone = false;
    }
    if(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      isEmail = true;
    }
    else {
      isEmail = false;
    }
    if(RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$").hasMatch(password)) {
      isPassword = true;
    }
    else {
      isPassword = false;
    }
    if(isName && isPhone && isEmail && isPassword) {
      isChecked = true;
    }
    else {
      isChecked = false;
    }
    notifyListeners();
  }

  void createUser(String name, String phone, String email) async {
    final user = UserUseCase(name, phone, email);
    await DataRepository().createUser(user);
  }
}

final signinProvider = ChangeNotifierProvider<SignInNotifier>((ref) => SignInNotifier());

class SignInNotifier extends ChangeNotifier {
  bool isEmail = false;
  bool isPassword = false;
  bool isChecked = false;

  void checkCreds(String email, String password) {
    if(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email) || email.length > 2) {
      isEmail = true;
    }
    else {
      isEmail = false;
    }
    if(RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$").hasMatch(password)) {
      isPassword = true;
    }
    else {
      isPassword = false;
    }
    if(isEmail && isPassword) {
      isChecked = true;
    }
    else {
      isChecked = false;
    }
    notifyListeners();
  }

  void loginUser(String email) async {
    final user = UserUseCase("name", "phone", email);
    await DataRepository().loginUser(user);
  }
}