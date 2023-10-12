import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/dashboard/posts_questions/components/posts/post_list.dart';
import 'package:diaspex/views/dashboard/posts_questions/components/questions/question_list.dart';
import 'package:flutter/material.dart';

part './components/quest_post_tab.dart';

class QuestionPostSegment extends StatelessWidget {
  const QuestionPostSegment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: AppColors.borderLight))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppConstants.defaultSpacing,
              right: AppConstants.defaultSpacing,
              top: AppConstants.defaultSpacing,
            ),
            child: Text(
              AppStrings.whatOthersSay,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: AppConstants.xSmallSpacing),
          const QuestPostTab(),
          SizedBox(height: AppConstants.defaultSpacing),
        ],
      ),
    );
  }
}
