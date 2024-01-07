import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/enums/category_post_enum.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/category/category.dart';
import 'package:diaspex/view_models/category_vm.dart';
import 'package:diaspex/view_models/nav_vm.dart';
import 'package:diaspex/view_models/post_vm.dart';
import 'package:diaspex/views/dashboard/posts_questions/components/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:diaspex/config/theme_config.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryVM>(builder: (ctx, state, _) {
      if (state.status == FormStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return MaterialApp(
        color: AppColors.btnPrimary,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.defaultTheme,
        home: Scaffold(
            backgroundColor: AppColors.bgLight,
            appBar: AppBar(
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize:
                        Size(double.infinity, AppConstants.xSmallMedium),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: CupertinoSegmentedControl(
                          borderColor: AppColors.bgGray,
                          selectedColor: AppColors.btnPrimary,
                          unselectedColor: AppColors.bgLight,
                          children: <String, Widget>{
                            for (var e in state.questionCategories)
                              e.title: Padding(
                                padding:
                                    EdgeInsets.all(AppConstants.smallMedium),
                                child: Text(e.title,
                                    style: TextStyle(
                                        fontSize: AppConstants.smallMedium)),
                              ),
                          },
                          groupValue: state.currentQuestionCategory.title,
                          onValueChanged: (value) {
                            state.setCurrentQuestionCategory(value);
                          }),
                    ))),
            body: Consumer<PostVm>(builder: (ctx, postState, _) {
              if (postState.status == FormStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (postState.status != FormStatus.loading &&
                  postState.posts.isEmpty) {
                return const Center(
                  child: Text("Empty here"),
                );
              }

              return ListView(
                  children: state.currentQuestionCategory.title == "All"
                      ? postState.posts
                          .where((element) =>
                              element.type == CategoryPostType.question.index)
                          .map((post) => PostCard(post: post))
                          .toList()
                      : postState.posts
                          .where((element) =>
                              element.categoryId ==
                                  state.currentQuestionCategory.id &&
                              element.type == CategoryPostType.question.index)
                          .toList()
                          .map((post) {
                          return PostCard(post: post);
                        }).toList());
            })),
      );
    });
  }
}
