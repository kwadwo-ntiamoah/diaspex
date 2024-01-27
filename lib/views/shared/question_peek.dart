import 'package:diaspex/data/models/post/post.dart';
import 'package:flutter/material.dart';

import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';

class QuestionPeekWidget extends StatelessWidget {
  final Post post;

  const QuestionPeekWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppConstants.smallMedium),
      decoration: BoxDecoration(
          border: Border.symmetric(
        horizontal: BorderSide(color: AppColors.bgGray),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.remove_red_eye, size: AppConstants.smallIconSize),
              Text(post.owner.split("@")[0],
                  style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
          Row(
            children: [
              Icon(Icons.favorite_outline_rounded,
                  color: AppColors.iconDark,
                  size: AppConstants.defaultSpacing),
              SizedBox(width: AppConstants.smallSpacing),
              Icon(Icons.share,
                  color: AppColors.iconDark,
                  size: AppConstants.defaultSpacing),
            ],
          )
        ],
      ),
    );
  }
}
