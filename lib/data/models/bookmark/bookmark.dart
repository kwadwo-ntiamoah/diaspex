import 'package:diaspex/data/models/post/post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bookmark.g.dart';

@JsonSerializable()
class Bookmark {
  final String postId;
  final int id;

  Bookmark({
    required this.id,
    required this.postId,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
  Map<String, dynamic> toJson() => _$BookmarkToJson(this);
}
