import 'package:diaspex/domain/entity/login.entity.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

import 'package:diaspex/domain/usecase/auth.usecase.dart';

class LoginVM extends ChangeNotifier {
  AuthUseCase authUseCase;

  LoginVM({required this.authUseCase});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameCtrl => _usernameController;
  TextEditingController get passwordCtrl => _passwordController;
  bool get obscureText => _obscureText;

  void toggleVisibility() {
    _obscureText = !_obscureText;

    notifyListeners();
  }

  Future loginWithEmail() async {
    if (_formKey.currentState!.validate()) {
      var payload = LoginPayload(
          email: _usernameController.value.text,
          password: _passwordController.value.text);

      await authUseCase.loginWithEmail(payload);
    }
  }
}
