import 'dart:ui';
import 'package:get/get.dart';
import '../lang/ar_SY.dart';
import '../lang/en_US.dart';

class LocalizationService extends Translations {
  static final locale = Locale('en', 'US');
  static final fallbackLocale = Locale('ar', 'SY');

  final langs = ['English', 'Arabic'];

  final locales = [
    Locale('en', 'US'),
    Locale('ar', 'SY'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ar_SY': arSY,
      };

  void change(String lang) {
    final locale = _getLocale(lang);
    Get.updateLocale(locale);
  }

  Locale _getLocale(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
