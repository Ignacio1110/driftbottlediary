import 'dart:ui';

import 'package:get/get.dart';

class DiaryTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': _enUS,
        'zh_TW': _zhTW,
      };

  static const String hello = 'hello';
  static const String greeting = 'greeting';
  static const String app_title = 'app_title';
  static const String drift_bottle = 'drift_bottle';
  static const String note = 'note';
  static const String settings = 'settings';
  static const String switch_language = 'switch_language';
  static const String switch_notification = 'switch_notification';
  static const String use_english = 'use_english';
  static const String mood_question = 'mood_question';
  static const String new_diary = 'New Diary';
  static const String save = 'save';
  static const String cancel = 'cancel';

  //diary page
  static const String write_diary = 'write_diary';

  static final Map<String, String> _enUS = {
    hello: 'Hello, World!',
    greeting: 'Welcome, {name}!',
    app_title: 'Drift Bottle Diary',
    drift_bottle: 'drift bottle',
    note: 'note',
    settings: 'settings',
    switch_language: 'Switch language',
    switch_notification: 'switch notification',
    use_english: 'use english',
    write_diary: 'write',
    mood_question: 'How are you feeling today?',
    new_diary: 'New Diary',
    save: 'save',
    cancel: 'cancel',
  };

  static final Map<String, String> _zhTW = {
    hello: '你好，世界！',
    greeting: '歡迎，{name}！',
    app_title: '漂流瓶日記',
    drift_bottle: '漂流瓶',
    note: '記事',
    settings: '設定',
    switch_language: '切換語言',
    switch_notification: '切換提醒',
    use_english: '使用英文',
    write_diary: '寫心情',
    mood_question: '你的心情如何？',
    new_diary: '新日誌',
    save: '儲存',
    cancel: '取消'
  };

  static String get locale => Get.deviceLocale.toString();

  static void changeLocale(String locale) {
    Get.updateLocale(Locale(locale));
  }
}
