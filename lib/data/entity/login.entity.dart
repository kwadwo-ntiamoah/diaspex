class LoginEntity {
  final String email, password;

  LoginEntity({ required this.email, required this.password });

  toJson() {
    return { "email": email, "password": password };
  }
}