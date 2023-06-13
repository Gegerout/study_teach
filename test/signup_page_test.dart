import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_teach/auth/presentation/pages/signup_page.dart';

void main() {
  group("signup page tests", () { 
    testWidgets("name field test", (tester) async {
      final nameField = find.widgetWithText(TextFormField, "Enter your full name");
      final successIcon = find.image(const AssetImage("assets/images/success_icon.png"));
      final errorText = find.text("Wrong Name");
      final enterButton = find.byKey(const Key("Enter"));

      await tester.runAsync(() => tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SignUpPage(),
            ),
          ),
        )
      ));

      await tester.enterText(nameField, "Something");
      await tester.pumpAndSettle();
      expect(successIcon, findsOneWidget);

      await tester.enterText(nameField, "sm");
      await tester.dragUntilVisible(
        enterButton,
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );
      await tester.tap(enterButton);
      await tester.pumpAndSettle();
      expect(errorText, findsOneWidget);
    });
    testWidgets("phone field test", (tester) async {
      final nameField = find.widgetWithText(TextFormField, "Enter your full name");
      final phoneField = find.widgetWithText(TextFormField, "Enter your phone number");
      final successIcon = find.image(const AssetImage("assets/images/success_icon.png"));
      final errorText = find.text("Wrong Phone");
      final enterButton = find.byKey(const Key("Enter"));

      await tester.runAsync(() => tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: SignUpPage(),
              ),
            ),
          )
      ));

      await tester.enterText(nameField, "Something");
      await tester.pumpAndSettle();

      await tester.enterText(phoneField, "7273289429");
      await tester.pumpAndSettle();
      expect(successIcon, findsWidgets);

      await tester.enterText(phoneField, "32989");
      await tester.dragUntilVisible(
        enterButton,
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );
      await tester.tap(enterButton);
      await tester.pumpAndSettle();
      expect(errorText, findsOneWidget);
    });
    testWidgets("email field test", (tester) async {
      final nameField = find.widgetWithText(TextFormField, "Enter your full name");
      final phoneField = find.widgetWithText(TextFormField, "Enter your phone number");
      final emailField = find.widgetWithText(TextFormField, "Enter your email address");
      final successIcon = find.image(const AssetImage("assets/images/success_icon.png"));
      final errorText = find.text("Wrong Email");
      final enterButton = find.byKey(const Key("Enter"));

      await tester.runAsync(() => tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: SignUpPage(),
              ),
            ),
          )
      ));

      await tester.enterText(nameField, "Something");
      await tester.pumpAndSettle();

      await tester.enterText(phoneField, "7273289429");
      await tester.pumpAndSettle();

      await tester.enterText(emailField, "hfshkjh@jhsk.com");
      await tester.pumpAndSettle();
      expect(successIcon, findsWidgets);

      await tester.enterText(emailField, "fjhjsdhj@@@jdskjj,cds");
      await tester.dragUntilVisible(
        enterButton,
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );
      await tester.tap(enterButton);
      await tester.pumpAndSettle();
      expect(errorText, findsOneWidget);
    });
    testWidgets("password field test", (tester) async {
      final nameField = find.widgetWithText(TextFormField, "Enter your full name");
      final phoneField = find.widgetWithText(TextFormField, "Enter your phone number");
      final emailField = find.widgetWithText(TextFormField, "Enter your email address");
      final passwordField = find.widgetWithText(TextFormField, "Enter your password");
      final successIcon = find.image(const AssetImage("assets/images/success_icon.png"));
      final errorText = find.text("Wrong Password");
      final enterButton = find.byKey(const Key("Enter"));

      await tester.runAsync(() => tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
              home: Scaffold(
                body: SignUpPage(),
              ),
            ),
          )
      ));

      await tester.enterText(nameField, "Something");
      await tester.pumpAndSettle();

      await tester.enterText(phoneField, "7273289429");
      await tester.pumpAndSettle();

      await tester.enterText(emailField, "hfshkjh@jhsk.com");
      await tester.pumpAndSettle();

      await tester.enterText(passwordField, "2133FSfsff");
      await tester.dragUntilVisible(
        enterButton,
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );
      await tester.tap(enterButton);
      await tester.pumpAndSettle();
      expect(errorText, findsOneWidget);

      await tester.tap(find.widgetWithText(ElevatedButton, "Ok"));
      await tester.pumpAndSettle();

      await tester.enterText(passwordField, "123455HJHJsdhjk\$");
      await tester.pumpAndSettle();
      expect(successIcon, findsWidgets);
    });
  });
}