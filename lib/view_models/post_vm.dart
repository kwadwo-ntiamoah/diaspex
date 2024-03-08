import 'package:diaspex/data/entity/post.entity.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';
import 'package:diaspex/data/models/bookmark/bookmark.dart';
import 'package:diaspex/data/models/like/like.dart';
import 'package:diaspex/data/models/post/post.dart';
import 'package:diaspex/data/repos/post.repo.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:flutter/cupertino.dart';

import 'dart:developer' as developer;

class PostVm extends ChangeNotifier with ErrorNotifierMixin {
  final IPostRepo postRepo;

  PostVm({required this.postRepo});

  FormStatus _status = FormStatus.init;
  FormStatus _addPostStatus = FormStatus.init;

  FormStatus get status => _status;
  FormStatus get addPostStatus => _addPostStatus;

  final TextEditingController _postContentController = TextEditingController();
  TextEditingController get postContentController => _postContentController;

  final List<Post> _posts = [];
  List<Post> get posts => _posts;

  final List<Like> _likedPosts = [];
  List<Like> get likedPosts => _likedPosts;

  final List<Bookmark> _bookmarkedPosts = [];
  List<Bookmark> get bookmarkedPosts => _bookmarkedPosts;

  Future getAllPosts() async {
    try {
      _status = FormStatus.loading;
      notifyListeners();

      await getLikedPosts();
      await getBookmarkedPosts();

      // get categories
      ApiResponse response = await postRepo.getAllPosts();

      if (response.status == 200) {
        _posts.clear();

        for (var temp in response.data) {
          var tempPost = Post.fromJson(temp);

          _posts.add(tempPost);
          _posts.sort((a, b) => b.createdDate.compareTo(a.createdDate));
        }
        _status = FormStatus.passed;
      } else {
        notifyError(response.message);
        _status = FormStatus.failed;
      }

      notifyListeners();
    } catch (e) {
      notifyError(e.toString());
      notifyListeners();
    }
  }

  Future addPost(PostEntity post) async {
    try {
      // validations
      if (post.categoryId.isEmpty || post.categoryId == "All") {
        notifyError("Select a category to continue");
        notifyListeners();

        return;
      }

      if (post.title.isEmpty || post.content.isEmpty) {
        notifyError("Title or content cannot be empty");
        notifyListeners();

        return;
      }

      _addPostStatus = FormStatus.loading;
      notifyListeners();

      await getLikedPosts();
      await getBookmarkedPosts();

      // post post hahahahaha :)ß
      ApiResponse response = await postRepo.addPost(post);

      if (response.status == 201) {
        _addPostStatus = FormStatus.passed;
      } else {
        notifyError(response.message);
        _addPostStatus = FormStatus.failed;
      }

      notifyListeners();
    } catch (e) {
      _addPostStatus = FormStatus.failed;
      notifyError(e.toString());
      notifyListeners();
    }
  }

  Future likePost(String postId) async {
    try {
      await postRepo.likePost(postId);
      await getLikedPosts();
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future unlikePost(String postId) async {
    try {
      await postRepo.unlikePost(postId);
      await getLikedPosts();
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future bookmarkPost(String postId) async {
    try {
      await postRepo.bookmarkPost(postId);
      await getBookmarkedPosts();
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future removePostBookmark(String postId) async {
    try {
      await postRepo.removePostBookmark(postId);
      await getBookmarkedPosts();
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future getBookmarkedPosts() async {
    try {
      var response = await postRepo.getBookmarkedPosts();

      if (response.status == 200) {
        _bookmarkedPosts.clear();

        for (var temp in response.data) {
          var tempPost = Bookmark.fromJson(temp);

          _bookmarkedPosts.add(tempPost);
        }

        notifyListeners();
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future getLikedPosts() async {
    try {
      var response = await postRepo.getLikedPosts();

      if (response.status == 200) {
        _likedPosts.clear();

        for (var temp in response.data) {
          var tempPost = Like.fromJson(temp);

          _likedPosts.add(tempPost);
        }

        notifyListeners();
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  void resetState() {
    _addPostStatus = FormStatus.init;
    _status = FormStatus.init;
    _postContentController.value = TextEditingValue.empty;
  }
}
