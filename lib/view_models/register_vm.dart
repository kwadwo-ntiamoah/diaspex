import 'package:diaspex/data/entity/register.entity.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/token/token.dart';
import 'package:diaspex/data/repos/auth.repo.dart';
import 'package:diaspex/services/storage.dart';
import 'package:diaspex/services/utils.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterVM extends ChangeNotifier with ErrorNotifierMixin {
  IAuthRepo authRepo;
  IStorage storage;

  RegisterVM({required this.authRepo, required this.storage});

  final _formKey = GlobalKey<FormState>();

  // auth controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpCodeController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // profile controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  // obscure passwords
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // form status
  FormStatus _formStatus = FormStatus.init;
  FormStatus _sendVerifyCodeStatus = FormStatus.init;
  FormStatus _verifyCodeStatus = FormStatus.init;

  // getter methods
  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get otpCodeController => _otpCodeController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  TextEditingController get nameController => _nameController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get countryController => _countryController;
  TextEditingController get dateOfBirthController => _dateOfBirthController;

  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;

  FormStatus get formStatus => _formStatus;
  FormStatus get sendVerifyCodeStatus => _sendVerifyCodeStatus;
  FormStatus get verifyCodeStatus => _verifyCodeStatus;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;

    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword = !_obscureConfirmPassword;

    notifyListeners();
  }

  void toggleLoader() {
    _formStatus =
        _formStatus == FormStatus.init ? FormStatus.loading : FormStatus.init;

    notifyListeners();
  }

  Future sendConfirmationCode() async {
    try {
      if (_nameController.value.text.isEmpty ||
          _usernameController.value.text.isEmpty) {
        notifyError("All fields marked* are required");
        notifyListeners();

        return;
      }

      _sendVerifyCodeStatus = FormStatus.loading;
      notifyListeners();

      // send confirmation code here
      var payload = SendEmailConfirmationCodeEntity(email: _usernameController.value.text);
      var tempConfirmationCode = await authRepo.sendConfirmationCode(payload);

      if (tempConfirmationCode.status == 200) {
        _sendVerifyCodeStatus = FormStatus.passed;
      } else {
        _sendVerifyCodeStatus = FormStatus.failed;
        notifyError(tempConfirmationCode.message);
      }

      notifyListeners();
    } catch (e) {
      _sendVerifyCodeStatus = FormStatus.failed;

      notifyError(e.toString());
      notifyListeners();
    }
  }

  Future verifyConfirmationCode() async {
    try {
      if (_otpCodeController.value.text.isEmpty) {
        notifyError("All fields marked* are required");
        notifyListeners();

        return;
      }

      _verifyCodeStatus = FormStatus.loading;
      notifyListeners();

      // send confirmation code here
      var payload = ConfirmCodeEntity(email: _usernameController.value.text, code: _otpCodeController.value.text);
      var tempCodeResponse = await authRepo.verifyCode(payload);

      if (tempCodeResponse.status == 200) {
        _verifyCodeStatus = FormStatus.passed;
      } else {
        _verifyCodeStatus = FormStatus.failed;
        notifyError(tempCodeResponse.message);
      }

      notifyListeners();
    } catch (e) {
      _verifyCodeStatus = FormStatus.failed;

      notifyError(e.toString());
      notifyListeners();
    }

  }

  void setDate(DateTime date) {
    _dateOfBirthController.text = Utils.parseDate(date.toString());
    notifyListeners();
  }

  Future registerLocal() async {
    try {
      _formStatus = FormStatus.loading;
      notifyListeners();

      var auth = AuthEntity(
        email: _usernameController.value.text,
        password: _passwordController.value.text,
      );

      var names = _nameController.value.text.split(" ");

      var surname = names.isNotEmpty ? names[0] : "";
      var otherNames = names.skip(1).isNotEmpty ? names.skip(1).join(" ") : "";

      var profile = ProfileEntity(
        surname: surname,
        otherNames: otherNames,
        phoneNumber: _phoneNumberController.value.text,
        country: _countryController.value.text,
        dateOfBirth: _dateOfBirthController.value.text,
      );

      var payload = RegisterLocalEntity(
        auth: auth,
        profile: profile,
      );

      var response = await authRepo.localRegister(payload);

      if (response.status == 201) {
        _formStatus = FormStatus.passed;
        notifyListeners();

        var data = Token.fromJson(response.data);

        // store token in storage
        await storage.setToken(data.token);

        // get user details
        var user = await authRepo.me();

        // set user details
        if (user.status == 200) {
          await storage.setUserDetails(user.data);
        }

        resetState();
      } else {
        _formStatus = FormStatus.failed;
        notifyError(response.message);
      }

      notifyListeners();
    } catch (e) {
      _formStatus = FormStatus.failed;
      notifyError(e.toString());
      notifyListeners();
    }
  }

  resetState() {
    _formStatus = FormStatus.init;
    _verifyCodeStatus = FormStatus.init;
    _sendVerifyCodeStatus = FormStatus.init;

    _usernameController.value = TextEditingValue.empty;
    _passwordController.value = TextEditingValue.empty;
    _confirmPasswordController.value = TextEditingValue.empty;
    _nameController.value = TextEditingValue.empty;
    _phoneNumberController.value = TextEditingValue.empty;
    _countryController.value = TextEditingValue.empty;
    _dateOfBirthController.value = TextEditingValue.empty;
    _otpCodeController.value = TextEditingValue.empty;

    notifyListeners();
  }
}
