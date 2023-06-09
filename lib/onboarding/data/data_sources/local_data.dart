import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/onboarding_model.dart';

class LocalData {
  Future<List<OnboardingModel>> loadData() async {
    final file = await rootBundle.loadString("assets/json/onboarding_data.json");
    final jsonFile = json.decode(file);
    final data = (jsonFile["data"] as List).map((value) => OnboardingModel.fromJson(value)).toList();
    return data;
  }
}