import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/views/shared/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:diaspex/generated/assets.dart';
import 'dart:developer' as developer;

part './components/notification_card.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgLight,
        appBar: SimpleAppBar(
          title: AppStrings.inbox,
          implyLeading: false,
        ),
        body: ListView(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppConstants.smallMedium,
                  horizontal: AppConstants.defaultSpacing,
                ),
                child: Text(
                  AppStrings.recent,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                )),
            Column(
                children: [1, 2, 3, 4, 5].map((e) {
              return const NotificationCard();
            }).toList())
          ],
        ));
  }
}
