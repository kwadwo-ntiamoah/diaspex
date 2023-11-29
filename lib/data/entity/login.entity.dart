class LoginPayload {
  final String email, password;

  LoginPayload({ required this.email, required this.password });

  toJson() {
    return { "email": email, "password": password };
  }
}