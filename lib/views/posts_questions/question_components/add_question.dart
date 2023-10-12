import 'package:diaspex/config/constants.dart';
import 'package:diaspex/views/posts_questions/common/add_field.dart';
import 'package:diaspex/views/shared/bottom_action.dart';
import 'package:flutter/material.dart';

import 'package:diaspex/config/theme_config.dart';

class AddQuestionView extends StatelessWidget {
  const AddQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
          child: const AddPostQuestionField(),
        ),
        BottomActionButton(buttonLabel: "Post", onPressed: (){})
      ],
    );
  }
}
