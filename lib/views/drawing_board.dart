import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:flutter/material.dart';

class DrawingBoard extends StatelessWidget {
  const DrawingBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
        child: ListView(
          children: [
            SizedBox(height: AppConstants.smallSpacing),
            DButton(label: AppStrings.login, onPressed: () {}),
            SizedBox(height: AppConstants.smallSpacing),
            DSecondaryButton(label: AppStrings.login, onPressed: () {}),
            SizedBox(height: AppConstants.smallSpacing),
            DLoadingButton(),
            SizedBox(height: AppConstants.smallSpacing),
            DDisabledButton(label: AppStrings.login),
            SizedBox(height: AppConstants.smallSpacing),
            DSocialButton(
                icon: Assets.iconsFacebook,
                label: AppStrings.continueWithFacebook,
                onPressed: () {}),
            SizedBox(height: AppConstants.smallSpacing),
            DSocialButton(
                icon: Assets.iconsGoogle,
                label: AppStrings.continueWithGoogle,
                onPressed: () {}),
            SizedBox(height: AppConstants.smallSpacing),
            DSocialButton(
                icon: Assets.iconsEmail,
                label: AppStrings.signUpWithEmail,
                onPressed: () {}),
            SizedBox(height: AppConstants.smallSpacing),
          ],
        ),
      ),
    );
  }
}
