import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/view_models/welcome_search_vm.dart';
import 'package:diaspex/views/dashboard/new_joiners/new_joiners.dart';
import 'package:diaspex/views/dashboard/posts_questions/questions_posts.dart';
import 'package:diaspex/views/dashboard/profile_sheet/profile_sheet.dart';
import 'package:diaspex/views/shared/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'latest_news/latest_news.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: AppColors.bgLight,
        title: const Welcome(),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppConstants.defaultSpacing,
              right: AppConstants.defaultSpacing,
              bottom: AppConstants.defaultSpacing,
              top: AppConstants.xSmallSpacing
            ),
            child: SearchButton(
              onTap: () {},
              prefix: Icons.search,
              labelText: AppStrings.askOrShare,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const NewJoiners(),
                SizedBox(height: AppConstants.smallSpacing),
                const LatestNews(),
                const QuestionPostSegment()
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: const KFloatingButton(),
    );
  }
}

class KFloatingButton extends StatelessWidget {
  const KFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.pushNamed(AppRoutes.addPostQuestion),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(width: 1.5, color: AppColors.btnPrimary),
      ),
      backgroundColor: AppColors.btnPrimary.withOpacity(.2),
      elevation: 0,
      highlightElevation: 0,
      mini: true,
      child: Icon(Icons.add,
          color: AppColors.primary, size: AppConstants.defaultSpacing),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WelcomeSearchVM>(
      builder: (context, state, _) {
        return GestureDetector(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings, color: AppColors.iconDark,)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications_rounded, color: AppColors.iconDark,)),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
