part of '../reply_post_question.dart';

class ReplyField extends StatelessWidget {
  const ReplyField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReplyVm>(
      builder: (context, state, _) {
        return DTextFormField(
          labelText: "Reply",
          controller: state.replyController,
          obscureText: false,
        );
      },
    );
  }
}
