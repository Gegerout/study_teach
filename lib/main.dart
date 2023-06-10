import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_teach/home/presentation/pages/home_page.dart';
import 'package:study_teach/home/presentation/states/home_provider.dart';
import 'package:study_teach/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: ref.watch(getUserProvider).when(
              data: (value) {
                if(value != null) {
                  return HomePage();
                }
                return OnboardingPage();
              },
              error: (error, stacktrace) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}
