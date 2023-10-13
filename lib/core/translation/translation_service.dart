import 'package:flutter_template/core/translation/Languages/ar_language.dart';
import 'package:flutter_template/core/translation/Languages/en_language.dart';
import 'package:flutter_template/core/translation/Languages/tr_language.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': ENLanguage.map,
        'ar_SA': ARLanguage.map,
        'tr_TR': TRLanguage.map
      };
}

tr(String key) => key.tr;
