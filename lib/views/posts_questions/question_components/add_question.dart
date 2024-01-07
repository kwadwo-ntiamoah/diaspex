import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/entity/post.entity.dart';
import 'package:diaspex/data/enums/category_post_enum.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/generated/assets.dart';
import 'package:diaspex/shared/GAlert/g_alert.dart';
import 'package:diaspex/shared/g_error_listener.dart';
import 'package:diaspex/view_models/category_vm.dart';
import 'package:diaspex/view_models/post_vm.dart';
import 'package:diaspex/views/posts_questions/common/add_field.dart';
import 'package:diaspex/views/shared/app_button.dart';
import 'package:diaspex/views/shared/bottom_action.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AddQuestionView extends StatelessWidget {
  const AddQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GErrorListener<PostVm>(
      child: Consumer2<CategoryVM, PostVm>(
        builder: (context, categoryState, postState, _) {
          if (postState.status == FormStatus.loading ||
              postState.addPostStatus == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (postState.addPostStatus == FormStatus.passed) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              GAlertWithCustomIcon(
                context: context,
                title: AppStrings.success,
                subtitle: "Question added successfully",
                icon: Lottie.asset(Assets.animationsSuccess,
                    width: 100, height: 100),
                onWillPop: () {
                  postState.resetState();
                  postState.getAllPosts();
                  context.go(AppRoutes.dashboard);
                },
                button: SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: DButton(
                      onPressed: () {
                        postState.resetState();
                        postState.getAllPosts();
                        context.go(AppRoutes.dashboard);
                      },
                      label: AppStrings.ok),
                ),
              ).fire();
            });
          }

          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultSpacing),
                child:
                    const AddPostQuestionField(type: CategoryPostType.question),
              ),
              BottomActionButton(
                  buttonLabel: "Ask Question",
                  onPressed: () {
                    var postData = PostEntity(
                      categoryId: categoryState.currentPostCategory.id,
                      title: categoryState.currentPostCategory.title,
                      content: postState.postContentController.value.text,
                      type: CategoryPostType.post.index,
                    );

                    postState.addPost(postData);
                  })
            ],
          );
        },
      ),
      onWillPop: () => context.pop(),
    );
  }
}
