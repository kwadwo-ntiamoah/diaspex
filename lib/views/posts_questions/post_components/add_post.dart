import 'package:diaspex/config/constants.dart';
import 'package:diaspex/views/posts_questions/common/add_field.dart';
import 'package:flutter/material.dart';


import 'package:diaspex/views/shared/bottom_action.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
          child: const AddPostQuestionField(
            labelText: "What do you want to share",
          ),
        ),
        BottomActionButton(buttonLabel: "Post", onPressed: () {})
      ],
    );
  }
}
