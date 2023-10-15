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
  static const String confirm = 'confirm';

  static const String cancel = 'cancel';
  static const String app_diary_foreword = 'app_diary_foreword';
  static const String delete_diary_dialog_title = 'delete_diary_dialog_title';
  static const String delete_diary_dialog_content =
      'delete_diary_dialog_content';

  static const String login_to_upload_data = 'login_to_upload_data';
  static const String upload_data = 'upload_data';
  static const String download_data = 'download_data';
  static const String signOut = 'signOut';
  static const String deleteAccount = 'deleteAccount';

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
    confirm: 'confirm',
    cancel: 'cancel',
    delete_diary_dialog_title: 'delete diary',
    delete_diary_dialog_content: 'Are you sure want to delete this diary',
    app_diary_foreword:
        'Everyone has a mood that they want to briefly describe\nRecord your daily mood, and you will find that there are always some happy moments in life ^_^',
    login_to_upload_data: 'sign in',
    upload_data: 'upload data',
    download_data: 'download data',
    signOut: 'Sign out',
    deleteAccount: 'Delete account',
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
    confirm: '確認',
    cancel: '取消',
    delete_diary_dialog_title: '刪除日記',
    delete_diary_dialog_content: '這篇日記將被移除！是否繼續?',
    app_diary_foreword: "每個人都有想簡單述說的心情\n紀錄每天的心情，會發現生活總有一些開心的時刻 ^_^",
    login_to_upload_data: '登入後可以備份雲端',
    upload_data: '上傳資料',
    download_data: '下載資料',
    signOut: '登出',
    deleteAccount: '刪除帳號',
  };

  static String get locale => Get.deviceLocale.toString();

  static void changeLocale(String locale) {
    Get.updateLocale(Locale(locale));
  }
}
