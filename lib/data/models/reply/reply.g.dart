// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reply _$ReplyFromJson(Map<String, dynamic> json) => Reply(
      id: json['id'] as String,
      owner: json['owner'] as String,
      postId: json['postId'] as String,
      content: json['content'] as String,
      createdDate: json['createdDate'] as String,
      modifiedDate: json['modifiedDate'] as String,
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$ReplyToJson(Reply instance) => <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'postId': instance.postId,
      'content': instance.content,
      'createdDate': instance.createdDate,
      'modifiedDate': instance.modifiedDate,
      'isDeleted': instance.isDeleted,
    };
