import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:diaspex/data/enums/category_post_enum.dart';
import 'package:diaspex/data/models/category/category.dart';
import 'package:diaspex/view_models/category_vm.dart';
import 'package:diaspex/view_models/post_vm.dart';
import 'package:diaspex/views/shared/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:diaspex/generated/assets.dart';
import 'package:provider/provider.dart';

class AddPostQuestionField extends StatelessWidget {
  final String? labelText;
  final CategoryPostType type;

  const AddPostQuestionField({
    super.key,
    required this.type,
    this.labelText = "Start typing your question here",
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<CategoryVM>(builder: (context, state, child) {
            var categories = type == CategoryPostType.post
                ? state.postCategories.where((element) => element.title != "All").toList()
                : state.questionCategories.where((element) => element.title != "All").toList();

            return SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    _CategoryCard(category: categories[index]),
                itemCount: categories.length,
              ),
            );
          }),
          SizedBox(height: AppConstants.defaultSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.iconsProfile),
              SizedBox(width: AppConstants.smallSpacing),
              Expanded(
                child: Consumer<PostVm>(builder: (context, state, _) {
                  return DTextFormField(
                    controller: state.postContentController,
                    fieldHeight: MediaQuery.of(context).size.height * .2,
                    labelText: labelText,
                    maxLines: 8,
                  );
                })
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;

  const _CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryVM>(builder: (context, state, _) {
      return GestureDetector(
        onTap: () {
          category.type == CategoryPostType.post.index
              ? state.setCurrentPostCategory(category.title)
              : state.setCurrentQuestionCategory(category.title);
        },
        child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: state.currentPostCategory == category ||
                          state.currentQuestionCategory == category
                      ? AppColors.bgPrimaryLight
                      : AppColors.bgGray),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: AppConstants.smallMedium + 5),
                child: Text(
                  category.title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            )),
      );
    });
  }
}
