import 'package:intl/intl.dart';

extension DateFormater on DateTime {
  String get toDDMMYYYYString => DateFormat("dd/MM/yyyy").format(this);
}
