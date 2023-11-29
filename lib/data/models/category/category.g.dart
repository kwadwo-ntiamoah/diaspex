// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$CategoryPostTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$CategoryPostTypeEnumMap[instance.type]!,
    };

const _$CategoryPostTypeEnumMap = {
  CategoryPostType.question: 'question',
  CategoryPostType.post: 'post',
};
