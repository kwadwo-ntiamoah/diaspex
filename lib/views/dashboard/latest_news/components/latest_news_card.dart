part of '../latest_news.dart';

class LatestNewsCard extends StatelessWidget {
  const LatestNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
          width: MediaQuery.of(context).size.width * .9,
          padding: EdgeInsets.only(right: AppConstants.xSmallMedium),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .2,
                child: Image.asset(Assets.imagesImageHolder,
                    fit: BoxFit.cover),
              ),
              Container(
                padding: EdgeInsets.only(top: AppConstants.xSmallMedium),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("2024 Scholarships in Germany", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: AppConstants.xxSmallSpacing),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Luctus ornare posuere risus fringilla phasellus. Luctus "
                        "ornare posuere risus fringilla... ", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.share, size: 20, color: AppColors.textGray,)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_rounded, color: AppColors.textGray)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_rounded, color: AppColors.textGray,)),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
