import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/view_models/reply_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ReplyList extends StatefulWidget {
  const ReplyList({super.key});

  @override
  State<ReplyList> createState() => _ReplyListState();
}

class _ReplyListState extends State<ReplyList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReplyVm>(builder: (context, state, _) {
      if (state.getRepliesStatus == FormStatus.loading) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      return Expanded(
          child: ListView(
        children: state.replies.map((reply) {
          return Container(
            padding: EdgeInsets.only(
                left: AppConstants.defaultSpacing * 2,
                right: AppConstants.defaultSpacing,
                bottom: AppConstants.smallMedium),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(Assets.iconsProfile),
                    SizedBox(width: AppConstants.smallSpacing),
                    Text(
                      reply.owner.split("@")[0],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: AppConstants.smallMedium,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: AppConstants.xSmallSpacing + 5),
                Text(
                  reply.content,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: AppConstants.xSmallMedium,
                      ),
                ),
                SizedBox(height: AppConstants.xSmallSpacing),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.push(AppRoutes.translateReply, extra: reply);
                        },
                        icon: Icon(
                          Icons.g_translate_sharp,
                          color: AppColors.iconDark,
                          size: AppConstants.defaultSpacing,
                        )),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.right,
                        GetTimeAgo.parse(DateTime.parse(reply.createdDate),
                            locale: 'en'),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppConstants.xSmallSpacing),
                Divider(
                  color: AppColors.borderLight,
                )
              ],
            ),
          );
        }).toList(),
      ));
    });
  }
}
