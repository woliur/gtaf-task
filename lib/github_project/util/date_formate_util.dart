import 'package:intl/intl.dart';
class DateUtil{

  static final instance = DateUtil();

  String formatDateWithTimeUTC(String date) {
    DateFormat inputFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZ");
    DateTime dateTime = inputFormat.parse(date,true);
    DateFormat outputFormat = DateFormat("HH:mm");
    String dateInString = outputFormat.format(dateTime);
    return dateInString;
  }
}