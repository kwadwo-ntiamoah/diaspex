import 'package:diaspex/view_models/external_auth.vm.dart';
import 'package:diaspex/view_models/login_vm.dart';
import 'package:diaspex/view_models/welcome_search_vm.dart';
import 'package:flutter/material.dart';

import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<WelcomeSearchVM, LoginVM, ExternalAuthVM>(builder: (context, state, loginState, externalAuthState, _) {
      return SingleChildScrollView(
        child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                      Text(AppStrings.profile),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.iconsProfilePlus,
                        width: AppConstants.xxLargeSpacing,
                      ),
                      SizedBox(height: AppConstants.smallSpacing),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppConstants.xSmallMedium,
                          horizontal: AppConstants.xMLargeSpacing,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.bgGray4,
                            borderRadius:
                            BorderRadius.circular(AppConstants.smallMedium)),
                        child: Text(
                          state.user ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: AppConstants.smallSpacing),
                      Text(
                        "Joined 2023",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: AppConstants.smallSpacing),
                      TextButton.icon(
                        onPressed: () {
                          loginState.resetState();
                          externalAuthState.resetState();
                          context.go(AppRoutes.auth);
                        },
                        icon: Icon(Icons.logout_rounded, color: AppColors.btnPrimary),
                        label: Text(
                          AppStrings.logout,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.btnPrimary),
                        ),
                      ),
                      SizedBox(height: AppConstants.xMLargeSpacing)
                    ],
                  ),
                ),
              ],
            )),
      );
    });
  }
}
