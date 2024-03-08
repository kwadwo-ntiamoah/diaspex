import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class RegisterWrapper extends StatelessWidget {
  final String pageName;
  final Widget child;

  const RegisterWrapper({
    super.key,
    required this.pageName,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
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
                Text(pageName),
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
                  child,
                ],
              )),
        ],
      ),
    );
  }
}
