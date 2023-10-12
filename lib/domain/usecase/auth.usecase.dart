import 'package:diaspex/domain/entity/login.entity.dart';

class AuthUseCase {
  AuthUseCase();

  Future loginWithEmail(LoginPayload payload) async {}

  void loginWithGoogle() {}

  void loginWithFacebook() {}

  void logout() {}
}