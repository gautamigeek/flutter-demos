// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_testing_demo/main.dart';

void main() {
  testWidgets('Local Authantication Testing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.runAsync(() async {
    await tester.pumpWidget(const MyApp());

    // login testing testing
    Finder emailTextField = find.byKey(const Key("loginEmail"));
    Finder passwordTextField = find.byKey(const Key('loginPassword'));
    Finder loginButton = find.byKey(const Key("loginButton"));
    Finder goToSignup = find.text("Sign Up Page");
    expect(emailTextField, findsOneWidget);
    expect(passwordTextField, findsOneWidget);
    expect(loginButton, findsOneWidget);
    expect(goToSignup, findsOneWidget);

    await tester.tap(goToSignup);
    await tester.pumpAndSettle(
      const Duration(milliseconds: 500),
      EnginePhase.sendSemanticsUpdate,
      const Duration(minutes: 10),
    );

    // signup testing testing
    Finder emailTextField1 = find.byKey(const Key("signupEmail"));
    Finder passwordTextField1 = find.byKey(const Key('signupPassword'));
    Finder signupButton = find.byKey(const Key("signupButton"));

    expect(emailTextField1, findsOneWidget);
    expect(passwordTextField1, findsOneWidget);
    expect(signupButton, findsOneWidget);

    await tester.enterText(passwordTextField1, "123456789");
    // tester.;
    await tester.enterText(emailTextField1, "gautam@gmail.com");
    print(tester.testTextInput);
    // await tester.tap(signupButton);
    // await tester.pumpAndSettle(
    //   const Duration(milliseconds: 500),
    //   EnginePhase.sendSemanticsUpdate,
    //   const Duration(minutes: 10),
    // );

    // // home page testing
    // Finder email = find.text("gautam@gmail.com");
    // Finder password = find.text("123456789");
    // // Finder logoutButton = find.text("Log out");
    // // Finder logoutButton = find.byKey(const Key("logoutButton"));
    // // Finder logoutButton = find.byElementType(ElevatedButton);

    // expect(email, findsOneWidget);
    // expect(password, findsOneWidget);
    // expect(logoutButton, findsOneWidget);
    // await tester.tap(logoutButton);
    // await tester.pumpAndSettle(
    //   const Duration(milliseconds: 500),
    //   EnginePhase.sendSemanticsUpdate,
    //   const Duration(minutes: 10),
    // );

    // // home page to login page testing
    // emailTextField = find.byKey(const Key("loginEmail"));
    // passwordTextField = find.byKey(const Key('loginPassword'));
    // loginButton = find.byKey(const Key("loginButton"));
    // goToSignup = find.text("Sign Up Page");

    // expect(emailTextField, findsOneWidget);
    // expect(passwordTextField, findsOneWidget);
    // expect(loginButton, findsOneWidget);
    // expect(goToSignup, findsOneWidget);

    // await tester.enterText(emailTextField, "gautam@gmail.com");
    // await tester.enterText(passwordTextField, "123456789");
    // await tester.tap(loginButton);
    // await tester.pumpAndSettle(
    //   const Duration(milliseconds: 500),
    //   EnginePhase.sendSemanticsUpdate,
    //   const Duration(minutes: 10),
    // );

    // // Login page to Home Page
    // email = find.text("gautam@gmail.com");
    // password = find.text("123456789");
    // logoutButton = find.byKey(const Key("logoutButton"));

    // expect(email, findsOneWidget);
    // expect(password, findsOneWidget);
    // expect(logoutButton, findsOneWidget);
  });
}
