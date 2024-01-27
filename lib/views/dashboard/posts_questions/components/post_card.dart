import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/models/post/post.dart';
import 'package:diaspex/views/shared/question_peek.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:go_router/go_router.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.replyPostQuestion, extra: post),
      child: Container(
        color: AppColors.bgLight,
        padding: EdgeInsets.all(AppConstants.defaultSpacing),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                            post.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            child: Text(
                              textAlign: TextAlign.right,
                              GetTimeAgo.parse(DateTime.parse(post.createdDate), locale: 'en'),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: AppConstants.xSmallSpacing),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                            post.content,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: AppConstants.xSmallMedium,
                                    )),
                      ),
                      SizedBox(height: AppConstants.xSmallMedium),
                    ],
                  ),
                )
              ],
            ),
            QuestionPeekWidget(post: post),
          ],
        ),
      ),
    );
  }
}
