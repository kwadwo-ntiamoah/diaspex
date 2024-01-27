import 'package:diaspex/config/constants.dart';
import 'package:diaspex/data/entity/reply.entity.dart';
import 'package:diaspex/data/models/api_response/api_response.dart';
import 'package:diaspex/services/network/network.dart';

abstract class IReplyRepo {
  Future<ApiResponse> postReply(ReplyEntity reply);
  Future<ApiResponse> getPostReplies(String postId);
}

class ReplyRepo implements IReplyRepo {
  final IHttpClient client;

  ReplyRepo({required this.client});

  @override
  Future<ApiResponse> getPostReplies(String postId) async {
    return await client.get(ApiConstants.replies + postId);
  }

  @override
  Future<ApiResponse> postReply(ReplyEntity reply) async {
    return await client.post(ApiConstants.replies, reply.toJson());
  }
}
