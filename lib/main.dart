import 'package:flutter/material.dart';
import 'package:rcs_mobile/common/theme.dart';
import 'package:rcs_mobile/screens/login_screen.dart';
import 'package:rcs_mobile/screens/dashboard_screen.dart';
import 'package:rcs_mobile/screens/new_recycle.dart';

void main() {
  runApp(RcsApp());
}

class RcsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RCS App',
        theme: rcsTheme,
        home: DashboardScreen(),
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          DashboardScreen.routeName: (_) => DashboardScreen(),
          NewRecycleScreen.routeName: (_) => NewRecycleScreen()
        });
  }
}
