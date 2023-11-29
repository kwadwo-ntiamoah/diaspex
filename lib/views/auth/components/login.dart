import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/shared/g_error_listener.dart';
import 'package:diaspex/view_models/login_vm.dart';
import 'package:diaspex/views/auth/auth.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

part 'login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderDefault),
              ),
            ),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(AppStrings.login),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: AppColors.iconDark,
                    size: 28,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: AppConstants.defaultSpacing),
          Padding(
            padding: EdgeInsets.only(
              left: AppConstants.defaultSpacing,
              right: AppConstants.defaultSpacing,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  Assets.imagesLogo,
                  width: AppConstants.xxLargeSpacing,
                ),
                SizedBox(height: AppConstants.defaultSpacing),
                RichText(text: TextSpan(
                  text: "Login to ",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
                  children: [
                    TextSpan(text: "b4u Go", style: Theme.of(context).textTheme.bodyLarge)
                  ]
                )),
                SizedBox(height: AppConstants.smallSpacing),
                const LoginForm(),
                SizedBox(height: AppConstants.xxLargeSpacing)
              ],
            ),
          ),
        ],
      )),
    );
  }
}
