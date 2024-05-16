import 'package:json_annotation/json_annotation.dart';

class ParseDateAndTimeUtil implements JsonConverter<DateTime?, int?> {
  const ParseDateAndTimeUtil();

  @override
  DateTime? fromJson(int? val) {
    if (val == null) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch(val);
  }

  @override
  int? toJson(DateTime? val) {
    if (val == null) {
      return null;
    }

    return val.millisecondsSinceEpoch;
  }
}
