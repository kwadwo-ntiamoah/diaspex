import 'package:diaspex/data/enums/category_post_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String id, categoryId, owner, title, content, createdDate, modifiedDate;
  final bool isDeleted;
  final CategoryPostType type;

  Post({
    required this.id,
    required this.categoryId,
    required this.owner,
    required this.title,
    required this.content,
    required this.createdDate,
    required this.modifiedDate,
    required this.isDeleted,
    required this.type
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
