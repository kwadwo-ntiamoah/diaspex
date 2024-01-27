class ReplyEntity {
  final String postId, content;

  ReplyEntity({ required this.postId, required this.content });

  toJson() {
    return {
      "postId": postId,
      "content": content
    };
  }
}