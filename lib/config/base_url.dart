import 'package:clean_pattern/config/flavor.dart';

class BaseUrl {
  static const String _prdUrl = 'https://prod.com.vn';
  static const String _stgUrl = 'https://stg.com.vn';
  static const String _devUrl = 'https://dev.com.vn';
  // static const String _devUrl = 'http://10.0.0.44:5000';

  static String get serverUrl => switch (Flavor.env) {
        Environment.prod => _prdUrl,
        Environment.stg => _stgUrl,
        Environment.dev => _devUrl,
      };
}
