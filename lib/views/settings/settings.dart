import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/shared/simple_appBar.dart';
import 'package:flutter/material.dart';

part './components/settings_card.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: SimpleAppBar(
        title: AppStrings.settings,
        implyLeading: false,
      ).build(context),
      body: Column(
        children: [
          SettingsCard(title: "Account", icon: Icons.person, onPressed: () {}),
          SettingsCard(
            title: "Notifications",
            icon: Icons.notifications_rounded,
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
