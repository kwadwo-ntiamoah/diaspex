import 'package:diaspex/data/entity/verify_login.entity.dart';
import 'package:diaspex/data/enums/form_status.dart';
import 'package:diaspex/data/models/token/token.dart';
import 'package:diaspex/data/repos/auth.repo.dart';
import 'package:diaspex/services/storage.dart';
import 'package:diaspex/view_models/errorNotifier.mixin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer' as developer;

class ExternalAuthVM extends ChangeNotifier with ErrorNotifierMixin {
  GoogleSignIn googleSignIn;
  FirebaseAuth firebaseAuth;

  IAuthRepo authRepo;
  IStorage storage;

  ExternalAuthVM({
    required this.googleSignIn,
    required this.firebaseAuth,
    required this.authRepo,
    required this.storage
  });

  FormStatus _formStatus = FormStatus.init;
  bool? _isNewAccount;

  FormStatus get formStatus => _formStatus;
  bool get isNewAccount => _isNewAccount ?? false;

  Future handleGoogleSign() async {
    try {
      await googleSignIn.signOut();

      final GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account == null) {
        throw Exception("Authentication failed");
      }

      // if account != null, user is authenticated
      // get firebase login credentials
      var auth = await account.authentication;
      var credentials = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );

      final UserCredential authResult =
          await firebaseAuth.signInWithCredential(credentials);
      var user = authResult.user;

      // retrieve token from firebase user
      var idToken = await user?.getIdToken();

      await _verifyToken(idToken!);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future _verifyToken(String idToken) async {
    try {
      _formStatus = FormStatus.loading;
      notifyListeners();

      var payload = VerifyExtTokenEntity(idToken: idToken);
      var response = await authRepo.verifyExtToken(payload);

      if (response.status == 200) {
        var data = Token.fromJson(response.data);
        _isNewAccount = data.isNewAccount;

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
      }
    } catch (e) {
      _formStatus = FormStatus.failed;
      notifyError(e.toString());
      notifyListeners();
    }
  }

  void resetState() {
    _formStatus = FormStatus.init;
    notifyListeners();
  }
}
