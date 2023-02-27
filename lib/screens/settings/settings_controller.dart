import 'package:get/get.dart';

import '../../translations.dart';

class SettingsController extends GetxController {
  var notificationsEnabled = true.obs;
  var useEnglishEnabled = false.obs;

  void toggleNotifications() {
    notificationsEnabled.value = !notificationsEnabled.value;
  }

  void toggleLanguageEnabled() {
    useEnglishEnabled.value = !useEnglishEnabled.value;
    if (useEnglishEnabled.value) {
      DiaryTranslations.changeLocale('en_US');
    } else {
      DiaryTranslations.changeLocale('zh_TW');
    }
  }
}
