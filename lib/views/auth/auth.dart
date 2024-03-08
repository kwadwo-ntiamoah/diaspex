import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/shared/g_error_listener.dart';
import 'package:diaspex/view_models/external_auth.vm.dart';
import 'package:diaspex/views/auth/components/login.dart';
import 'package:diaspex/views/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'dart:developer' as developer;
import 'dart:developer' as developer;

part 'components/action_buttons.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
