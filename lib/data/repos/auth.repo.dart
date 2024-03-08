import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/entity/register.entity.dart';
import 'package:diaspex/data/entity/verify_login.entity.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:diaspex/data/entity/login.entity.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';

abstract class IAuthRepo {
  Future<ApiResponse> verifyExtToken(VerifyExtTokenEntity payload);
  Future<ApiResponse> localLogin(LoginEntity payload);
  Future<ApiResponse> localRegister(RegisterLocalEntity payload);
  Future<ApiResponse> me();
  Future<ApiResponse> sendConfirmationCode(SendEmailConfirmationCodeEntity payload);
  Future<ApiResponse> verifyCode(ConfirmCodeEntity payload);
}

class AuthRepo implements IAuthRepo {
  final IHttpClient client;

  AuthRepo({required this.client});

  @override
  Future<ApiResponse> localLogin(LoginEntity payload) async {
    return await client.post(ApiConstants.token, payload.toJson());
  }

  @override
  Future<ApiResponse> me() async {
    return await client.get(ApiConstants.me);
  }

  @override
  Future<ApiResponse> verifyExtToken(VerifyExtTokenEntity payload) async {
    return await client.post(ApiConstants.externalToken, payload.toJson());
  }
  
  @override
  Future<ApiResponse> localRegister(RegisterLocalEntity payload) async {
    return await client.post(ApiConstants.registerLocal, payload.toJson());
  }

  @override
  Future<ApiResponse> sendConfirmationCode(SendEmailConfirmationCodeEntity payload) async {
    return await client.post(ApiConstants.sendConfirmationCode, payload.toJson());
  }

  @override
  Future<ApiResponse> verifyCode(ConfirmCodeEntity payload) async {
    return await client.post(ApiConstants.confirmCode, payload.toJson());
  }
}
