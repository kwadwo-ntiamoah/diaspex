import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/post/post.dart';
import 'package:diaspex/shared/g_error_listener.dart';
import 'package:diaspex/view_models/reply_vm.dart';
import 'package:diaspex/views/posts_questions/common/reply_list.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:diaspex/views/shared/question_peek.dart';
import 'package:diaspex/views/shared/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:diaspex/config/constants.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'common/reply_card.dart';
part 'common/reply_field.dart';

class ReplyPostQuestionView extends StatefulWidget {
  final Post post;

  const ReplyPostQuestionView({super.key, required this.post});

  @override
  State<ReplyPostQuestionView> createState() => _ReplyPostQuestionViewState();
}

class _ReplyPostQuestionViewState extends State<ReplyPostQuestionView> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ReplyVm>().setCurrentPost(widget.post);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: const SimpleAppBar(
        title: "Go Back",
        centerTitle: false,
      ),
      body: const ReplyPostQuestionBody(),
    );
  }
}

class ReplyPostQuestionBody extends StatelessWidget {
  const ReplyPostQuestionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReplyVm>(
      builder: (context, state, _) {
        if (state.postReplyStatus == FormStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.postReplyStatus == FormStatus.passed) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            state.resetState();
            state.getPostReplies();
          });
        }

        return GErrorListener<ReplyVm>(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    children: [
                      ReplyCard(),
                      ReplyList()
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(AppConstants.defaultSpacing),
                  color: AppColors.borderLight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: ReplyField()),
                      IconButton(
                        onPressed: () => state.postReply(),
                        icon: Icon(Icons.send, color: AppColors.primary,),
                      )
                    ],
                  ),
                )
              ],
            ),
            onWillPop: () {
              context.pop();
              state.resetState();
            });
      },
    );
  }
}
