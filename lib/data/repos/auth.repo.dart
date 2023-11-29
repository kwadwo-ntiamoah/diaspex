import 'package:diaspex/config/constants.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:diaspex/data/entity/login.entity.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';

abstract class IAuthRepo {
  Future<ApiResponse> localLogin(LoginPayload payload);
  Future<ApiResponse> me();
}

class AuthRepo implements IAuthRepo {
  final IHttpClient client;

  AuthRepo({required this.client});

  @override
  Future<ApiResponse> localLogin(LoginPayload payload) async {
    return await client.post(ApiConstants.token, payload.toJson());
  }

  @override
  Future<ApiResponse> me() async {
    return await client.get(ApiConstants.me);
  }
}
