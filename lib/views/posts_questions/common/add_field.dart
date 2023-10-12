import 'package:diaspex/config/constants.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:diaspex/generated/assets.dart';

class AddPostQuestionField extends StatelessWidget {
  final String? labelText;
  const AddPostQuestionField({
    super.key,
    this.labelText = "Start typing your question here",
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.iconsProfile),
          SizedBox(width: AppConstants.smallSpacing),
          Expanded(
            child: DTextFormField(
              controller: TextEditingController(),
              fieldHeight: MediaQuery.of(context).size.height * .2,
              labelText: labelText,
              maxLines: 8,
            ),
          )
        ],
      ),
    );
  }
}
