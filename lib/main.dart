import 'package:flutter/material.dart';
import 'package:rcs_mobile/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:rcs_mobile/common/theme.dart';
import 'package:rcs_mobile/providers/recycled_items_provider.dart';
import 'package:rcs_mobile/screens/dashboard_screen.dart';
import 'package:rcs_mobile/screens/onboarding/onboarding_screen.dart';

import 'screens/login/email_sign_up_screen.dart';
import 'screens/onboarding/onboarding.dart';
import 'package:rcs_mobile/screens/new_recycle.dart';
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
      ],
      child: MaterialApp(
          title: 'RCS App',
          theme: rcsTheme,
          home: Onboarding(),
          routes: {
            OnboardingScreen.routeName: (_) => OnboardingScreen(),
            EmailSignUpScreen.routeName: (_) => EmailSignUpScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
            DashboardScreen.routeName: (_) => DashboardScreen(),
            NewRecycleScreen.routeName: (_) => NewRecycleScreen(),
            RecycleItemDetailScreen.routeName: (_) => RecycleItemDetailScreen(),
          }),
    );
  }
}
