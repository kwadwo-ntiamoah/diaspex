import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/entity/translate.entity.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';
import 'package:diaspex/services/network/network.dart';

abstract class IMiscRepo {
  Future<ApiResponse> translateText(TranslateEntity payload);
}

class MiscRepo implements IMiscRepo {
  final IHttpClient client;

  MiscRepo({required this.client});

  @override
  Future<ApiResponse> translateText(TranslateEntity payload) async {
    return await client.post(ApiConstants.translate, payload.toJson());
  }
}
