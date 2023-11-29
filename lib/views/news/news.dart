import 'package:cached_network_image/cached_network_image.dart';
import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/models/news/news.dart';
import 'package:diaspex/services/utils.dart';
import 'package:diaspex/views/shared/simple_appbar.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final News news;

  const NewsDetails({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: SimpleAppBar(title: news.title, centerTitle: false),
      body: ListView(
        children: [
          Divider(
            color: AppColors.borderLight,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConstants.defaultSpacing,
                vertical: AppConstants.smallMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: AppConstants.smallSpacing),
                CachedNetworkImage(imageUrl: news.image),
                SizedBox(height: AppConstants.defaultSpacing),
                Wrap(
                  children: [
                    Text(news.content, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.textGray)),
                  ],
                ),
                SizedBox(height: AppConstants.defaultSpacing),
                RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.textGray, fontSize: 12),
                        text: "Published on ",
                        children: [
                      TextSpan(
                        text: Utils.parseDate(news.modifiedDate),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.textDark, fontSize: 12),
                      )
                    ])),
                Text(
                  "Admin",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontStyle: FontStyle.italic,
                      color: AppColors.textGray,
                      fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
