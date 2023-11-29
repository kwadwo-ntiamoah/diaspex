import 'package:diaspex/views/dashboard/dashboard.dart';
import 'package:diaspex/views/notifications/notifications.dart';
import 'package:diaspex/views/search/search.dart';
import 'package:diaspex/views/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../config/theme_config.dart';
import '../../view_models/nav_vm.dart';

part 'bottom_navigator/bottom_navigator.dart';

class AppIndex extends StatelessWidget {
  const AppIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppNavigationVM>(builder: (ctx, state, _) {
        switch (state.currentBottomNavIndex) {
          case 0:
            return const DashboardView();
          case 1:
            return const SearchView();
          case 2:
            return const NotificationsView();
          case 3:
            return const SettingsView();
          default:
            return const DashboardView();
        }
      }),
      bottomNavigationBar: const DiaspexBottomNavBar(),
    );
  }
}
