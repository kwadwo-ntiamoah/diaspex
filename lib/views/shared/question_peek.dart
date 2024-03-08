import 'package:diaspex/data/models/post/post.dart';
import 'package:diaspex/view_models/post_vm.dart';
import 'package:flutter/material.dart';

import 'package:diaspex/config/constants.dart';
import 'package:diaspex/config/theme_config.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class QuestionPeekWidget extends StatelessWidget {
  final Post? post;

  const QuestionPeekWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return post == null
        ? const CircularProgressIndicator()
        : Container(
            padding: EdgeInsets.symmetric(vertical: AppConstants.smallMedium),
            decoration: BoxDecoration(
                border: Border.symmetric(
              horizontal: BorderSide(color: AppColors.bgGray),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.remove_red_eye,
                        size: AppConstants.smallIconSize),
                    Text(post!.owner.split("@")[0],
                        style: Theme.of(context).textTheme.titleMedium)
                  ],
                ),
                Consumer<PostVm>(builder: (context, state, _) {
                  var isLiked =
                      state.likedPosts.any((like) => like.postId == post!.id);

                  var isBookmarked = state.bookmarkedPosts
                      .any((bookmark) => bookmark.postId == post!.id);

                  return Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            isLiked
                                ? state.unlikePost(post!.id)
                                : state.likePost(post!.id);
                          },
                          icon: Icon(
                              isLiked
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline_rounded,
                              color: isLiked
                                  ? AppColors.error
                                  : AppColors.iconDark,
                              size: AppConstants.defaultSpacing)),
                      IconButton(
                          onPressed: () {
                            isBookmarked
                                ? state.removePostBookmark(post!.id)
                                : state.bookmarkPost(post!.id);
                          },
                          icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark_rounded
                                  : Icons.bookmark_outline_rounded,
                              color: AppColors.iconDark,
                              size: AppConstants.defaultSpacing)),
                      IconButton(
                        onPressed: () {
                          context.push(AppRoutes.translatePost, extra: post);
                        },
                        icon: Icon(
                          Icons.g_translate_sharp,
                          color: AppColors.iconDark,
                          size: AppConstants.defaultSpacing,
                        ),
                      )
                    ],
                  );
                })
              ],
            ),
          );
  }
}
