import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/entity/post.entity.dart';
import 'package:diaspex/services/network/network.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';

abstract class IPostRepo {
  Future<ApiResponse> getAllPosts();
  Future<ApiResponse> addPost(PostEntity post);
  Future<ApiResponse> likePost(String postId);
  Future<ApiResponse> unlikePost(String postId);
  Future<ApiResponse> bookmarkPost(String postId);
  Future<ApiResponse> removePostBookmark(String postId);
  Future<ApiResponse> getLikedPosts();
  Future<ApiResponse> getBookmarkedPosts();
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

  @override
  Future<ApiResponse> bookmarkPost(String postId) async {
    var url = "${ApiConstants.bookmarks}?postId=$postId";
    return await client.post(url, {});
  }

  @override
  Future<ApiResponse> likePost(String postId) async {
    var url = "${ApiConstants.likes}?postId=$postId";
    return await client.post(url, {});
  }

  @override
  Future<ApiResponse> removePostBookmark(String postId) async {
    var url = "${ApiConstants.removeBookmark}?postId=$postId";
    return await client.post(url, {});
  }

  @override
  Future<ApiResponse> unlikePost(String postId) async {
    var url = "${ApiConstants.removeLike}?postId=$postId";
    return await client.post(url, {});
  }

  @override
  Future<ApiResponse> getBookmarkedPosts() async {
    return await client.get(ApiConstants.bookmarks);
  }

  @override
  Future<ApiResponse> getLikedPosts() async {
    return await client.get(ApiConstants.likes);
  }
}
