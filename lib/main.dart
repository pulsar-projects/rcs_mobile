import 'package:flutter/material.dart';
import 'package:rcs_mobile/screens/login/login_screen.dart';
import 'package:rcs_mobile/screens/dashboard_screen.dart';
import 'package:rcs_mobile/screens/onboarding/onboarding_screen.dart';

import 'screens/login/email_sign_up_screen.dart';
import 'screens/onboarding/onboarding.dart';

void main() {
  runApp(RcsApp());
}

class RcsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RCS App',
        theme: ThemeData(),
        home: Onboarding(),
//        home: LoginScreen(),
        routes: {
          OnboardingScreen.routeName: (_) => OnboardingScreen(),
          EmailSignUpScreen.routeName: (_) => EmailSignUpScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          DashboardScreen.routeName: (_) => DashboardScreen(),
        });
  }
}
