// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String?,
      isNewAccount: json['isNewAccount'] as bool?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
      'isNewAccount': instance.isNewAccount,
      'refreshToken': instance.refreshToken,
    };
