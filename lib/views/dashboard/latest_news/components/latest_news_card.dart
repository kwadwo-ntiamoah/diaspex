part of '../latest_news.dart';

class LatestNewsCard extends StatelessWidget {
  final News news;

  const LatestNewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: () {
          context.pushNamed(AppRoutes.news, extra: news);
        },
        child: Container(
            width: MediaQuery.of(context).size.width * .9,
            padding: EdgeInsets.only(right: AppConstants.xSmallMedium),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .2,
                  child: CachedNetworkImage(
                    imageUrl: news.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Icon(
                      Icons.perm_media_rounded,
                      size: AppConstants.defaultSpacing,
                      color: AppColors.iconDark,
                    ),
                    errorWidget: (context, url, _) => Icon(
                      Icons.perm_media_rounded,
                      size: AppConstants.defaultSpacing,
                      color: AppColors.iconDark,
                    ),
                  ),
                  // child: Image.network(news.image, fit: BoxFit.cover),
                ),
                Container(
                  padding: EdgeInsets.only(top: AppConstants.xSmallMedium),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(news.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: AppConstants.xxSmallSpacing),
                      Text(news.content.trim(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 12)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: FaIcon(
                                FontAwesomeIcons.share,
                                size: 20,
                                color: AppColors.textGray,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark_border_rounded,
                                  color: AppColors.textGray)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_horiz_rounded,
                                color: AppColors.textGray,
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
