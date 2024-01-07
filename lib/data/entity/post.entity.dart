class PostEntity {
  final String categoryId, title, content;
  final int type;

  PostEntity(
      {required this.categoryId,
      required this.title,
      required this.content,
      required this.type});

  toJson() {
    return {
      "categoryId": categoryId,
      "title": title,
      "content": content,
      "type": type
    };
  }
}
