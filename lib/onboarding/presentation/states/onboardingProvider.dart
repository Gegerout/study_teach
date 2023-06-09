import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_teach/onboarding/data/models/onboarding_model.dart';
import 'package:study_teach/onboarding/data/repositories/data_repository.dart';

final onboardingProvider = FutureProvider<List<OnboardingModel>>((ref) async {
  final data = await DataRepository().loadData();
  return data.data;
});

final onboardingStates = StateNotifierProvider<OnboardingStateNotifier, int>((ref) => OnboardingStateNotifier());

class OnboardingStateNotifier extends StateNotifier<int> {
  OnboardingStateNotifier() : super(0);

  void changeIndex(int index) => state = index;
}