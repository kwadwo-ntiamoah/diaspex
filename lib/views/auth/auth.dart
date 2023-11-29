import 'package:diaspex/config/app_notification_provider.dart';
import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/service_locator.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/view_models/login_vm.dart';
import 'package:diaspex/views/auth/components/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../shared/app_button.dart';

part 'components/action_buttons.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(Assets.imagesAuthBanner, fit: BoxFit.cover)),
            Positioned(
              bottom: AppConstants.xxLargeSpacing,
              left: 0,
              right: 0,
              child: const ActionButtons(),
            )
          ],
        ),
      ),
    );
  }
}
