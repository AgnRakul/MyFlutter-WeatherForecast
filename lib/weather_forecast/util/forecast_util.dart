import 'package:intl/intl.dart';

class Util {
  static String appId = "";

// To Format the date
  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEE, MMM d, y").format(dateTime);
  }

// Sunrise and Sunset
  static String getFormattedTime(DateTime dateTime) {
    return new DateFormat("K:mm a").format(dateTime);
  }
}
