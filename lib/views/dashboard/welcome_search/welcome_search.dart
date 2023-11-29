import 'package:diaspex/config/constants.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/view_models/welcome_search_vm.dart';
import 'package:diaspex/views/dashboard/profile_sheet/profile_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/shared/app_text_field.dart';
import 'package:provider/provider.dart';

class WelcomeSearch extends StatefulWidget {
  const WelcomeSearch({super.key});

  @override
  State<WelcomeSearch> createState() => _WelcomeSearchState();
}

class _WelcomeSearchState extends State<WelcomeSearch> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    context.read<WelcomeSearchVM>().getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WelcomeSearchVM>(builder: (context, state, _) {
      return Padding(
        padding: EdgeInsets.only(
            top: AppConstants.defaultSpacing,
            left: AppConstants.defaultSpacing,
            right: AppConstants.defaultSpacing),
        child: FlexibleSpaceBar(
          background: Column(
            children: [
              SizedBox(height: AppConstants.smallMedium),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: AppColors.bgLight,
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) {
                      return const ProfileSheet();
                    },
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.iconsProfile),
                    SizedBox(width: AppConstants.xSmallMedium),
                    Text(
                      "Welcome ${state.user ?? ""}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: AppConstants.xSmallMedium),
              SearchButton(
                onTap: () {},
                prefix: Icons.search,
                labelText: AppStrings.askOrShare,
              )
            ],
          ),
        ),
      );
    });
  }
}
