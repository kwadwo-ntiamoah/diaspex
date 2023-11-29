import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/entity/paged.entity.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';

abstract class INewsRepo {
  Future<ApiResponse> getAllNews(Pager pager);
  Future<ApiResponse> getSingleNews(String newsId);
}

class NewsRepo implements INewsRepo {
  final IHttpClient client;

  NewsRepo({required this.client});

  @override
  Future<ApiResponse> getAllNews(Pager pager) async {
    return await client.get(ApiConstants.news, queryParams: pager.toQueryParams());
  }

  @override
  Future<ApiResponse> getSingleNews(String newsId) async {
    return await client.get("${ApiConstants.news}/$newsId");
  }
}
