import 'package:flutter/material.dart';
import 'package:rcs_mobile/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:rcs_mobile/common/theme.dart';
import 'package:rcs_mobile/providers/recycle_center_provider.dart';
import 'package:rcs_mobile/providers/recycled_items_provider.dart';
import 'package:rcs_mobile/screens/dashboard_screen.dart';
import 'package:rcs_mobile/screens/onboarding/onboarding_screen.dart';
import 'screens/login/email_sign_screen.dart';
import 'screens/onboarding/onboarding.dart';
import 'package:rcs_mobile/screens/recycle_item_add_screen.dart';
import 'package:rcs_mobile/screens/recycle_item_detail_screen.dart';

void main() {
  runApp(RcsApp());
}

class RcsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecycledItemsProvider()),
        ChangeNotifierProvider(create: (_) => RecycleCentersProvider())
      ],
      child: MaterialApp(
          title: 'RCS App',
          theme: rcsTheme,
          home: Onboarding(),
          routes: {
            OnboardingScreen.routeName: (_) => OnboardingScreen(),
            EmailSignScreen.routeName: (_) => EmailSignScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
            DashboardScreen.routeName: (_) => DashboardScreen(),
            RecycleItemAddScreen.routeName: (_) => RecycleItemAddScreen(),
            RecycleItemDetailScreen.routeName: (_) => RecycleItemDetailScreen(),
          }),
    );
  }
}
