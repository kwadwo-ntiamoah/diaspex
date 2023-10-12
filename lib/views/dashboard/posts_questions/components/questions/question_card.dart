import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/shared/question_peek.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:diaspex/generated/assets.dart';
import 'package:go_router/go_router.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.replyQuestion.routeName),
      child: Container(
        color: AppColors.bgLight,
        padding: EdgeInsets.all(AppConstants.defaultSpacing),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(Assets.iconsProfile),
                SizedBox(width: AppConstants.smallSpacing),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Thompson Roseville",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text("1hr ago",
                              style: Theme.of(context).textTheme.titleMedium)
                        ],
                      ),
                      SizedBox(height: AppConstants.xSmallSpacing),
                      Text(
                          "Lorem ipsum dolor sit amet, consecrate missals disciplining elite?",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: AppConstants.xSmallMedium,
                              )),
                      SizedBox(height: AppConstants.xSmallMedium),
                    ],
                  ),
                )
              ],
            ),
            const QuestionPeekWidget(),
          ],
        ),
      ),
    );
  }
}
