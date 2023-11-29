part of '../notifications.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        bottom: 12,
        left: AppConstants.defaultSpacing,
        right: AppConstants.defaultSpacing,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.iconsProfile, height: AppConstants.xLargeSpacing),
          SizedBox(width: AppConstants.xSmallMedium),
          Expanded(
            child: InkWell(
              onTap: () => developer.log("Hello world"),
              child: Container(
                  padding: EdgeInsets.all(AppConstants.smallSpacing),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppConstants.xSmallSpacing),
                      color: AppColors.bgPrimaryLight2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Thompson Osnille",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Now", style: Theme.of(context).textTheme.titleMedium)
                        ],
                      ),
                      SizedBox(height: AppConstants.smallIconSize),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur "
                                "issajus adipiscing elit?",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(height: AppConstants.smallIconSize),
                          Text("Commented on your post", style: Theme.of(context).textTheme.titleMedium)
                        ],
                      )
                    ],
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
