part of '../reply_post_question.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgLight,
      padding: EdgeInsets.all(AppConstants.defaultSpacing),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.iconsProfile),
              SizedBox(width: AppConstants.smallSpacing),
              Consumer<ReplyVm>(builder: (context, state, _) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.currentPost?.title ?? "...",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppConstants.xSmallSpacing),
                      Text(state.currentPost?.content ?? "...loading",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: AppConstants.xSmallMedium,
                                  )),
                      SizedBox(height: AppConstants.xSmallMedium),
                    ],
                  ),
                );
              })
            ],
          ),
          QuestionPeekWidget(post: context.read<ReplyVm>().currentPost!),
        ],
      ),
    );
  }
}
