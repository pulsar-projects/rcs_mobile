import 'package:flutter/material.dart';
import 'package:rcs_mobile/screens/login_screen.dart';
import 'package:rcs_mobile/screens/dashboard_screen.dart';

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
        home: LoginScreen(),
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          DashboardScreen.routeName: (_) => DashboardScreen(),
        });
  }
}
