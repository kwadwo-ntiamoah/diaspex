import 'package:flutter/material.dart';

import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';

class QuestionPeekWidget extends StatelessWidget {
  const QuestionPeekWidget({super.key});

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
              Icon(Icons.remove_red_eye,
                  size: AppConstants.smallIconSize),
              Text("1.2k views",
                  style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
          Row(
            children: [
              Icon(Icons.remove_red_eye,
                  size: AppConstants.smallIconSize),
              Text("900 answers",
                  style: Theme.of(context).textTheme.titleMedium)
            ],
          )
        ],
      ),
    );
  }
}
