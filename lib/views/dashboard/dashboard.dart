import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/dashboard/new_joiners/new_joiners.dart';
import 'package:diaspex/views/dashboard/posts_questions/questions_posts.dart';
import 'package:diaspex/views/dashboard/welcome_search/welcome_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'latest_news/latest_news.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * .15,
        backgroundColor: AppColors.bgLight,
        flexibleSpace: const WelcomeSearch(),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          const NewJoiners(),
          SizedBox(height: AppConstants.smallSpacing),
          const LatestNews(),
          const QuestionPostSegment()
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
      onPressed: () => context.pushNamed(AppRoutes.addPostQuestion.routeName),
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

