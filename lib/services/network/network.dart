import 'dart:io';
import 'package:diaspex/config/service_locator.dart';
import 'package:diaspex/services/network/interceptors.dart';
import 'package:dio/dio.dart';

import '../../data/models/api_response/api_response.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {

    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

abstract class IHttpClient {
  Future<ApiResponse> get(String url, {Map<String, dynamic> queryParams});
  Future<ApiResponse> post(String url, Map<String, dynamic> payload);
}

class DioClient implements IHttpClient {
  final Dio dio;

  DioClient({required this.dio}) {
    dio.interceptors.addAll(
      [
        AuthInterceptor(storage: getIt()),
        LogInterceptor(responseBody: true),
      ],
    );
  }

  @override
  Future<ApiResponse> get(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      var response = await dio.get(url, queryParameters: queryParams);
      return ApiResponse.fromJson(response.data);
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on DioException catch (e) {
      if (e.response == null) {
        if (e.error != null) {
          throw Exception((e.error as SocketException).message);
        }

        throw Exception(e.message);
      }
      if (e.response != null && e.response?.statusCode == 400) {
        throw Exception(e.response?.data["title"]);
      }

      if (e.response != null && e.response?.statusCode == 401) {
        throw Exception("You're unauthorized to perform this action");
      }

      throw Exception("An unknown error occurred. Try again later");
    } catch (e) {
      throw Exception("Sorry an error occurred");
    }
  }

  @override
  Future<ApiResponse> post(String url, Map<String, dynamic> payload) async {
    try {
      var response = await dio.post(url, data: payload);
      return ApiResponse.fromJson(response.data);
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on DioException catch (e) {
      if (e.response == null) {
        if (e.error != null) {
          throw Exception((e.error as SocketException).message);
        }

        throw Exception(e.message);
      }
      if (e.response != null && e.response?.statusCode == 400) {
        throw Exception(e.response?.data["title"]);
      }

      if (e.response != null && e.response?.statusCode == 401) {
        throw Exception("You're unauthorized to perform this action");
      }

      throw Exception("An unknown error occurred. Try again later");
    } catch (e) {
      throw Exception("Sorry an error occurred");
    }
  }
}
