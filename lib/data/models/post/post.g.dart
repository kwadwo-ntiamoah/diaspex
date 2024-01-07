// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      owner: json['owner'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdDate: json['createdDate'] as String,
      modifiedDate: json['modifiedDate'] as String,
      isDeleted: json['isDeleted'] as bool,
      type: json['type'] as int,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'owner': instance.owner,
      'title': instance.title,
      'content': instance.content,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'isDeleted': instance.isDeleted,
      'type': instance.type,
    };
