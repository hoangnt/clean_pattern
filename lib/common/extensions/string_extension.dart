import 'package:intl/intl.dart';

extension DateFormater on DateTime {
  String toDDMMYYYYString() {
    return DateFormat("dd/MM/yyyy").format(this);
  }
}