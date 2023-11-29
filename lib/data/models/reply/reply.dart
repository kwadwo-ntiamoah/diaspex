import 'package:json_annotation/json_annotation.dart';

part 'reply.g.dart';

@JsonSerializable()
class Reply {
  final String id, owner, postId, content, createdDate, modifiedDate;
  final bool isDeleted;

  Reply({
    required this.id,
    required this.owner,
    required this.postId,
    required this.content,
    required this.createdDate,
    required this.modifiedDate,
    required this.isDeleted,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyToJson(this);
}
