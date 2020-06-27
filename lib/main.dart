import 'package:flutter/material.dart';
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
        home: DashboardScreen(),
        routes: {
          DashboardScreen.routeName: (_) => DashboardScreen(),
        });
  }
}
