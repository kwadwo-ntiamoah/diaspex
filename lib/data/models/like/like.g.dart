// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Like _$LikeFromJson(Map<String, dynamic> json) => Like(
      id: json['id'] as int,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
    };
