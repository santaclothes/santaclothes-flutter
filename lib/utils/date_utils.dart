import 'package:intl/intl.dart';

String convertToOutputFormat(String date, String outputPattern) {
  var inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm");
  var inputDate = inputFormat.parse(date);

  var outputFormat = DateFormat(outputPattern);
  var outputDate = outputFormat.format(inputDate);

  return outputDate.toString();
}
