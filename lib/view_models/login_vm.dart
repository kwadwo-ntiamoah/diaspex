import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/token/token.dart';
import 'package:diaspex/data/repos/auth.repo.dart';
import 'package:diaspex/services/storage.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:diaspex/data/entity/login.entity.dart';

class LoginVM extends ChangeNotifier with ErrorNotifierMixin {
  IAuthRepo authRepo;
  IStorage storage;

  LoginVM({required this.authRepo, required this.storage});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  FormStatus _formStatus = FormStatus.init;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameCtrl => _usernameController;
  TextEditingController get passwordCtrl => _passwordController;

  bool get obscureText => _obscureText;
  FormStatus get formStatus => _formStatus;

  void toggleVisibility() {
    _obscureText = !_obscureText;

    notifyListeners();
  }

  void toggleLoader() {
    _formStatus = _formStatus == FormStatus.init
        ? FormStatus.loading
        : FormStatus.init;

    notifyListeners();
  }

  Future loginWithEmail() async {
    if (_usernameController.value.text.isEmpty) {
      notifyError("Email is required");
      notifyListeners();
      return;
    }

    if (_passwordController.value.text.isEmpty) {
      notifyError("Password is required");
      notifyListeners();
      return;
    }

    try {
      toggleLoader();

      if (_formKey.currentState!.validate()) {
        var payload = LoginEntity(
            email: _usernameController.value.text,
            password: _passwordController.value.text);

        var response = await authRepo.localLogin(payload);

        if (response.status == 200) {
          var data = Token.fromJson(response.data);

          // store token in storage
          await storage.setToken(data.token);

          // get user details
          var user = await authRepo.me();

          // set user details
          if (user.status == 200) {
            await storage.setUserDetails(user.data);
          }

          _formStatus = FormStatus.passed;
          notifyListeners();

          return;
        }

        notifyError(response.message);
        notifyListeners();
      }
    } catch(e) {
      _formStatus = FormStatus.failed;
      notifyError(e.toString());
      notifyListeners();
    }
  }

  resetState() {
    _formStatus = FormStatus.init;
    _passwordController.value = TextEditingValue.empty;

    notifyListeners();
  }
}
