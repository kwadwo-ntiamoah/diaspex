import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'components/new_joiner_card.dart';

class NewJoiners extends StatelessWidget {
  const NewJoiners({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgGray,
      padding: EdgeInsets.only(
          left: AppConstants.defaultSpacing,
          bottom: AppConstants.defaultSpacing,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppStrings.meetNewJoiners,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(right: AppConstants.defaultSpacing),
                child: TextButton(
                    onPressed: () {},
                    child: Text(AppStrings.viewAll,
                        style: Theme.of(context).textTheme.titleMedium)),
              )
            ],
          ),
          SizedBox(height: AppConstants.xSmallSpacing),
          SizedBox(
            height: AppConstants.xLargeSpacing,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
                  .map((e) => const NewJoinerCard())
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
