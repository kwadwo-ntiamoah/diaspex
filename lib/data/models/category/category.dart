import 'package:diaspex/data/enums/category_post_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  final String id, title, description;
  final CategoryPostType type;

  Category({ required this.id, required this.title, required this.description, required this.type });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}