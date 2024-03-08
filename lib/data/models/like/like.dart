import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class Like {
  final String postId;
  final int id;

  Like({
    required this.id,
    required this.postId,
  });

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
  Map<String, dynamic> toJson() => _$LikeToJson(this);
}
