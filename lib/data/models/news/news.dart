import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final String id, title, content, image, createdDate, modifiedDate;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.createdDate,
    required this.modifiedDate,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
