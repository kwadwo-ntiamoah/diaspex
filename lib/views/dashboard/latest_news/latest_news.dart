import 'dart:ffi';

import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part './components/latest_news_card.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.latestNews, style: Theme.of(context).textTheme.displayMedium),
              TextButton(
                  onPressed: () {},
                  child: Text(AppStrings.viewAll,
                      style: Theme.of(context).textTheme.titleMedium))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: AppConstants.defaultSpacing),
          height: MediaQuery.of(context).size.height * .4,
          child: SizedBox(
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
                  .map((e) => const LatestNewsCard())
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
