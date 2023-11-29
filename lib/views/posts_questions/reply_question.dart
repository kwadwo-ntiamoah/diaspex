import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:diaspex/views/shared/bottom_action.dart';
import 'package:diaspex/views/shared/question_peek.dart';
import 'package:diaspex/views/shared/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:diaspex/config/constants.dart';
import 'package:diaspex/generated/assets.dart';

part 'question_components/reply_question_card.dart';
part 'question_components/reply_question_field.dart';

class ReplyQuestionView extends StatelessWidget {
  const ReplyQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: const SimpleAppBar(
        title: "Go Back",
        centerTitle: false,
      ),
      body: const ReplyQuestionBody(),
    );
  }
}

class ReplyQuestionBody extends StatelessWidget {
  const ReplyQuestionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: const [
            ReplyQuestionCard(),
            ReplyQuestionField(),
          ],
        ),
        BottomActionButton(
          onPressed: () {},
          buttonLabel: "Reply",
        )
      ],
    );
  }
}
