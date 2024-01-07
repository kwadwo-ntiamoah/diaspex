import 'package:cached_network_image/cached_network_image.dart';
import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/news/news.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/view_models/news_vm.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part './components/latest_news_card.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsVM>().getAllNews();
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.defaultSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.latestNews,
                  style: Theme.of(context).textTheme.displayMedium),
              TextButton(
                  onPressed: () {},
                  child: Text(AppStrings.viewAll,
                      style: Theme.of(context).textTheme.titleMedium))
            ],
          ),
        ),
        Consumer<NewsVM>(builder: (context, state, _) {
          if (state.news.isEmpty || state.status == FormStatus.loading) {
            return const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return Container(
            padding: EdgeInsets.only(left: AppConstants.defaultSpacing),
            height: MediaQuery.of(context).size.height * .4,
            child: SizedBox(
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: state.news
                    .map((news) => LatestNewsCard(news: news))
                    .toList(),
              ),
            ),
          );
        })
      ],
    );
  }
}
