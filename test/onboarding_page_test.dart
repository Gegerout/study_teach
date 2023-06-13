import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_teach/onboarding/data/repositories/data_repository.dart';
import 'package:study_teach/onboarding/presentation/pages/onboarding_page.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final data = await DataRepository().loadData();
  group("onboarding page tests", () {
    testWidgets("titles displayed correctly", (WidgetTester tester) async {
      final continueButton = find.byType(ElevatedButton);
      final title1 = find.text(data.data[0].subtitle);
      final title2 = find.text(data.data[1].subtitle);
      final title3 = find.text(data.data[2].subtitle);

      await tester.runAsync(() => tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: OnboardingPage(),
            ),
          ),
        )
      )
      );

      await tester.pumpAndSettle();

      expect(title1, findsOneWidget);

      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      expect(title2, findsOneWidget);

      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      expect(title3, findsOneWidget);
      await tester.pumpAndSettle();
    });
    testWidgets("images displayed correctly", (WidgetTester tester) async {
      final continueButton = find.byType(ElevatedButton);
      final image1 = find.image(AssetImage(data.data[0].image));
      final image2 = find.image(AssetImage(data.data[1].image));
      final image3 = find.image(AssetImage(data.data[2].image));

      await tester.runAsync(() => tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: OnboardingPage(),
              ),
            ),
          )
      )
      );

      await tester.pumpAndSettle();

      expect(image1, findsOneWidget);

      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      expect(image2, findsOneWidget);

      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      expect(image3, findsOneWidget);
      await tester.pumpAndSettle();
    });
    testWidgets("when ends it navigates to next page", (WidgetTester tester) async {
      final continueButton = find.byType(ElevatedButton);
      final scaffold = find.byKey(const Key("Welcome"));

      await tester.runAsync(() => tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: OnboardingPage(),
              ),
            ),
          )
      )
      );

      await tester.pumpAndSettle();

      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      await tester.tap(continueButton);
      await tester.pumpAndSettle();
      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      expect(scaffold, findsOneWidget);
    });
  });
}
