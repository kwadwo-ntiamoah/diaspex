import 'package:diaspex/config/constants.dart';
import 'package:diaspex/view_models/category_vm.dart';
import 'package:diaspex/view_models/nav_vm.dart';
import 'package:diaspex/views/dashboard/posts_questions/components/questions/question_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:diaspex/config/theme_config.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppNavigationVM, CategoryVM>(
        builder: (ctx, state, categoryState, _) {
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
                        children: {
                          for (var category in categoryState.questionCategories)
                            category.title: Padding(
                                padding:
                                    EdgeInsets.all(AppConstants.smallMedium),
                                child: Text(
                                  "Lifestyle",
                                  style: TextStyle(
                                      fontSize: AppConstants.smallMedium),
                                ))
                        },
                        // children: <String, Widget>{
                        //   "All": Padding(
                        //     padding: EdgeInsets.all(AppConstants.smallMedium),
                        //     child: Text(
                        //       "Lifestyle",
                        //       style:
                        //           TextStyle(fontSize: AppConstants.smallMedium),
                        //     ),
                        //   ),
                        //   "Category 2": Padding(
                        //     padding: EdgeInsets.all(AppConstants.smallMedium),
                        //     child: Text(
                        //       "School",
                        //       style:
                        //           TextStyle(fontSize: AppConstants.smallMedium),
                        //     ),
                        //   ),
                        //   "Category 3": Padding(
                        //     padding: EdgeInsets.all(AppConstants.smallMedium),
                        //     child: Text("Tourism", style: TextStyle(fontSize: AppConstants.smallMedium)),
                        //   ),
                        //   "Category 4": Padding(
                        //     padding: EdgeInsets.all(AppConstants.smallMedium),
                        //     child: Text("Security", style: TextStyle(fontSize: AppConstants.smallMedium)),
                        //   ),
                        //   "Food & Drinks": Padding(
                        //     padding: EdgeInsets.all(AppConstants.smallMedium),
                        //     child: Text("Food & Drinks", style: TextStyle(fontSize: AppConstants.smallMedium)),
                        //   ),
                        // },
                        groupValue: state.currentQuestionCategory,
                        onValueChanged: (value) {
                          state.setCurrentQuestionCategory(value);
                        }),
                  ))),
          body: ListView(
            children: const [
              QuestionCard(),
              QuestionCard(),
              QuestionCard(),
              QuestionCard(),
              QuestionCard(),
              QuestionCard(),
              QuestionCard(),
            ],
          ),
        ),
      );
    });
  }
}
