import 'package:get/get.dart';
import 'package:tiger_loyalty/translation/en.dart';
import 'package:tiger_loyalty/translation/sw.dart';

class TranslationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': englishLanguage(),
        'sw': swahiliLanguage(),
      };
}
