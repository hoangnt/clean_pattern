import 'package:clean_pattern/common/lang/lang_eng.dart';
import 'package:clean_pattern/common/lang/lang_vie.dart';
import 'package:get/get.dart';

class I18n extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': LangEng.lang,
        'vi_VN': LangVie.lang,
      };
}
