import 'package:intl/intl.dart';

String changeStringToDateTimeTypeHelper({required String text}) {
  DateTime dateTime = DateTime.parse(text);
  String formatted = DateFormat('dd.MM.yyyy').format(dateTime);
  return formatted;
}
