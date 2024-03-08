import 'package:diaspex/data/entity/translate.entity.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/enums/translate_type.dart';
import 'package:diaspex/data/models/post/post.dart';
import 'package:diaspex/data/models/reply/reply.dart';
import 'package:diaspex/data/repos/misc.repo.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:flutter/cupertino.dart';

class TranslateVM extends ChangeNotifier with ErrorNotifierMixin {
  final IMiscRepo miscRepo;

  TranslateVM({ required this.miscRepo });

  TranslationType _translationType = TranslationType.init;
  TranslationType get translationType => _translationType;

  String? _translatedText;
  String get translatedText => _translatedText!;

  FormStatus _formStatus = FormStatus.init;
  FormStatus get formStatus => _formStatus;

  Future translatePost(Post post) async {
    await _translate(post.content, TranslationType.post);
  }

  Future translateReply(Reply reply) async {
    await _translate(reply.content, TranslationType.reply);
  }

  // private
  Future _translate(String text, TranslationType type) async{
    try {
      _translationType = type;
      _formStatus = FormStatus.loading;
      notifyListeners();

      var payload = TranslateEntity(input: text);
      var response = await miscRepo.translateText(payload);

      if (response.status == 200) {
        _formStatus = FormStatus.passed;
        _translatedText = response.message;
      } else {
        _formStatus = FormStatus.failed;
        notifyError(response.data);
      }

      notifyListeners();
    } catch (e) {
      _formStatus = FormStatus.failed;

      notifyError(e.toString());
      notifyListeners();
    }
  }
}

