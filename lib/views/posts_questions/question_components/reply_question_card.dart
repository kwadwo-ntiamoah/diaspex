part of '../reply_question.dart';

class ReplyQuestionCard extends StatelessWidget {
  const ReplyQuestionCard({super.key});

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thompson Roseville",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: AppConstants.xSmallSpacing),
                    Text(
                        "Lorem ipsum dolor sit amet, consecrate missals disciplining elite?",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: AppConstants.xSmallMedium,
                        )),
                    SizedBox(height: AppConstants.xSmallMedium),
                  ],
                ),
              )
            ],
          ),
          const QuestionPeekWidget(),
        ],
      ),
    );
  }
}
