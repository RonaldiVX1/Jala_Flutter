import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String getFormatDate(String data) {
  final DateFormat date = DateFormat("d MMMM yyyy", 'en_US');

  final DateTime dueDate = DateFormat("yyyy-MM-dd").parse(data);

  return date.format(dueDate);
}

String getFormatDateFromDate(DateTime data) {
  return DateFormat("dd MMMM yyyy", 'en_US').format(data);
}
