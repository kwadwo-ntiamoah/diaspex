import 'package:diaspex/services/storage.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final IStorage storage;

  AuthInterceptor({ required this.storage });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.getToken();

    if (token != null) {
      options.headers.addAll({ "Authorization": "Bearer $token" });
    }

    handler.next(options);
  }

}