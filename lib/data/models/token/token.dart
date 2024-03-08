import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  final String token;
  final bool? isNewAccount;
  final String? refreshToken;

  Token({ required this.token, this.refreshToken, this.isNewAccount });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
