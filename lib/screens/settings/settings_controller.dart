import 'package:driftbottlediary/shared_module/diary_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../routes.dart';
import '../../shared_module/auth_service.dart';
import '../../shared_module/diary_database.dart';
import '../../translations.dart';

class SettingsController extends GetxController {
  Rx<User?> user = Rx<User?>(null);
  final RxBool notificationsEnabled = true.obs;
  final RxBool useEnglishEnabled = false.obs;

  goToSignIn() async {
    Get.toNamed(AppRoutes.LOGIN);
  }

  Future<void> uploadDiaryToCloud() async {
    if (kDebugMode) {
      print(await (await DiaryDatabase.instance.database).query(tableDiary));
      print('---------');
    }
    DiaryRepository.instance.uploadAllDiary();
  }

  Future<void> downloadDiaryFromCloud() async {
    await DiaryRepository.instance.downloadAllDiary();
  }

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

  @override
  void onInit() {
    user = Get.put(FirebaseAuthService()).user;
    super.onInit();
  }
}
