import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/entity/post.entity.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';

abstract class IPostRepo {
  Future<ApiResponse> getAllPosts();
  Future<ApiResponse> addPost(PostEntity post);
}

class PostRepo implements IPostRepo {
  final IHttpClient client;

  PostRepo({required this.client});

  @override
  Future<ApiResponse> getAllPosts() async {
    return await client.get(ApiConstants.posts);
  }

  @override
  Future<ApiResponse> addPost(PostEntity post) async {
    return await client.post(ApiConstants.posts, post.toJson());
  }
}
