import 'package:json_annotation/json_annotation.dart';
part 'login.entity.g.dart';

@JsonSerializable()
class LoginPayload {
  String email, password;

  LoginPayload({ required this.email, required this.password });

  Map<String, dynamic> toJson() => _$LoginPayloadToJson(this);
}
