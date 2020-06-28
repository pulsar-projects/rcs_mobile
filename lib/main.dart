import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcs_mobile/common/theme.dart';
import 'package:rcs_mobile/model/recycled_item_model.dart';
import 'package:rcs_mobile/providers/recycle_center_provider.dart';
import 'package:rcs_mobile/providers/recycled_items_provider.dart';
import 'package:rcs_mobile/screens/login_screen.dart';
import 'package:rcs_mobile/screens/dashboard_screen.dart';
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
        ChangeNotifierProvider(create: (_) => RecycleCentersProvider())
      ],
      child: MaterialApp(
          title: 'RCS App',
          theme: rcsTheme,
          home: DashboardScreen(),
          routes: {
            LoginScreen.routeName: (_) => LoginScreen(),
            DashboardScreen.routeName: (_) => DashboardScreen(),
            NewRecycleScreen.routeName: (_) => NewRecycleScreen(),
            RecycleItemDetailScreen.routeName: (_) => RecycleItemDetailScreen(),
          }),
    );
  }
}
