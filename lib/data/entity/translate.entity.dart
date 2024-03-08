class TranslateEntity {
  final String input;

  TranslateEntity({ required this.input });

  toJson() {
    return {
      "in": input
    };
  }
}