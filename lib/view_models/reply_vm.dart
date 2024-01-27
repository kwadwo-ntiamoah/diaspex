import 'package:diaspex/data/entity/reply.entity.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';
import 'package:diaspex/data/models/post/post.dart';
import 'package:diaspex/data/models/reply/reply.dart';
import 'package:diaspex/data/repos/reply.repo.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReplyVm extends ChangeNotifier with ErrorNotifierMixin {
  final IReplyRepo replyRepo;

  ReplyVm({required this.replyRepo});

  FormStatus _postReplyStatus = FormStatus.init;
  FormStatus _getRepliesStatus = FormStatus.init;

  FormStatus get postReplyStatus => _postReplyStatus;
  FormStatus get getRepliesStatus => _getRepliesStatus;

  Post? _currentPost;
  Post? get currentPost => _currentPost;

  final List<Reply> _replies = [];
  List<Reply> get replies => _replies;

  final TextEditingController _replyController = TextEditingController();
  TextEditingController get replyController => _replyController;

  setCurrentPost(Post post) async {
    _currentPost = post;
    _replies.clear();
    notifyListeners();

    await getPostReplies();
  }

  Future postReply() async {
    try {
      if (_currentPost!.id.isEmpty || _replyController.value.text.isEmpty) {
        notifyError("Enter reply before submitting");
        notifyListeners();

        return;
      }

      _postReplyStatus = FormStatus.loading;
      notifyListeners();

      var payload = ReplyEntity(
          postId: currentPost!.id, content: _replyController.value.text);
      ApiResponse response = await replyRepo.postReply(payload);

      if (response.status == 201 || response.status == 200) {
        _postReplyStatus = FormStatus.passed;
      } else {
        _postReplyStatus = FormStatus.failed;
        notifyError(response.message);
      }

      notifyListeners();
    } catch (e) {
      _postReplyStatus = FormStatus.failed;
      notifyError(e.toString());
      notifyListeners();
    }
  }

  Future getPostReplies() async {
    try {
      if (currentPost != null && currentPost!.id.isNotEmpty) {
        _getRepliesStatus = FormStatus.loading;
        notifyListeners();

        ApiResponse response = await replyRepo.getPostReplies(currentPost!.id);

        if (response.status == 200) {
          _getRepliesStatus = FormStatus.passed;

          for (var temp in response.data) {
            var tempReply = Reply.fromJson(temp);

            _replies.add(tempReply);
            _replies.sort((a, b) => b.createdDate.compareTo(a.createdDate));
          }
        } else {
          _getRepliesStatus = FormStatus.failed;
          notifyError(response.message);
        }

        notifyListeners();
      }
    } catch (e) {
      _getRepliesStatus = FormStatus.failed;
      notifyError(e.toString());
      notifyListeners();
    }
  }

  resetState() {
    _getRepliesStatus = FormStatus.init;
    _postReplyStatus = FormStatus.init;
    _replies.clear();
    _replyController.value = TextEditingValue.empty;

    notifyListeners();
  }
}
