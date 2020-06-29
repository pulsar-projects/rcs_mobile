import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/login_screen.dart';
import 'onboarding_screen.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with AfterLayoutMixin<Onboarding> {
  Future _checkIfSeen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool _seen = preferences.getBool('seen') ?? false;

    if (_seen) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else {
      await preferences.setBool('seen', true);
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => _checkIfSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
