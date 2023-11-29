import 'dart:io';

import 'package:intl/intl.dart';

class Utils {
  Utils._();

  static String parseDate(String dateTime) {
    DateFormat format = DateFormat("yyyy-MM-dd");

    DateTime dt = format.parse(dateTime);
    return format.format(dt);
  }
}