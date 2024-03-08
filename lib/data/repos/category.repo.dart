import 'package:diaspex/config/constants.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';

abstract class ICategoryRepo {
  Future<ApiResponse> getAllCategories();
  Future<ApiResponse> getSingleCategory(String categoryId);
}

class CategoryRepo implements ICategoryRepo {
  final IHttpClient client;

  CategoryRepo({required this.client});

  @override
  Future<ApiResponse> getAllCategories() async {
    return await client.get(ApiConstants.categories);
  }

  @override
  Future<ApiResponse> getSingleCategory(String categoryId) async {
    return await client.get("${ApiConstants.categories}/$categoryId");
  }
}
