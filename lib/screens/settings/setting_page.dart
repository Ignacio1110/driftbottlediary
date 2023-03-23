import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../translations.dart';
import 'settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(DiaryTranslations.settings.tr),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Obx(
            //   () => SwitchListTile(
            //     title: Text(
            //       DiaryTranslations.switch_notification.tr,
            //     ),
            //     value: settingsController.notificationsEnabled.value,
            //     onChanged: (value) {
            //       settingsController.toggleNotifications();
            //     },
            //   ),
            // ),
            Obx(
              () => SwitchListTile(
                title: Text(
                  DiaryTranslations.use_english.tr,
                ),
                value: controller.useEnglishEnabled.value,
                onChanged: (value) {
                  controller.toggleLanguageEnabled();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
