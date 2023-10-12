part of '../reply_question.dart';

class ReplyQuestionField extends StatelessWidget {
  const ReplyQuestionField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
      child: DTextFormField(
        labelText: "Reply",
        controller: TextEditingController(),
        obscureText: false,
        fieldHeight: MediaQuery.of(context).size.height * .2,
        maxLines: 8,
      ),
    );
  }
}
