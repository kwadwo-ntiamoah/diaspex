import 'package:diaspex/views/posts_questions/post_components/add_post.dart';
import 'package:diaspex/views/posts_questions/question_components/add_question.dart';
import 'package:diaspex/views/shared/bottom_action.dart';
import 'package:diaspex/views/shared/simple_appBar.dart';
import 'package:flutter/material.dart';

import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';

class AddPostQuestionView extends StatefulWidget {
  const AddPostQuestionView({super.key});

  @override
  State<AddPostQuestionView> createState() => _AddPostQuestionViewState();
}

class _AddPostQuestionViewState extends State<AddPostQuestionView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
        backgroundColor: AppColors.bgLight,
        appBar: SimpleAppBar(
          title: AppStrings.create,
          boldTitle: true,
        ).build(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: AppConstants.smallSpacing),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: AppColors.borderLight)),
                ),
                child: SizedBox(
                  height: AppConstants.largeSpacing,
                  child: TabBar(
                    isScrollable: true,
                    controller: tabController,
                    dividerColor: Colors.transparent,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    indicatorColor: AppColors.btnPrimary,
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    tabs: [
                      Tab(
                        text: AppStrings.questions,
                      ),
                      Tab(text: AppStrings.posts),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppConstants.smallSpacing),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    AddQuestionView(),
                    AddPostView(),
                  ],
                )
              )
            ],
          ),
        ));
  }
}
