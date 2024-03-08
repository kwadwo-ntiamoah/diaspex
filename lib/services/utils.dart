import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static String parseDate(String dateTime) {
    DateFormat format = DateFormat("yyyy-MM-dd");

    DateTime dt = format.parse(dateTime);
    return format.format(dt);
  }

  static String toDate(String date) {
    var temp = DateTime.parse(date);
    var tempString = temp.toString();

    return parseDate(tempString);
  }
}

class Validator {
  Validator._();

  static String? isRequired(String name, String? value) {
    if (value == null || value.isEmpty) {
      return '$name is required';
    }

    return null;
  }
}
