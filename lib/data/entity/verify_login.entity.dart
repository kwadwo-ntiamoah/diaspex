class VerifyExtTokenEntity {
  final String idToken;

  VerifyExtTokenEntity({ required this.idToken });

  toJson() {
    return {
      "idToken": idToken,
    };
  }
}