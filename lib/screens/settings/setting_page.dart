import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../translations.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => SwitchListTile(
              title: Text(
                DiaryTranslations.switch_notification.tr,
              ),
              value: settingsController.notificationsEnabled.value,
              onChanged: (value) {
                settingsController.toggleNotifications();
              },
            ),
          ),
          Obx(
            () => SwitchListTile(
              title: Text(
                DiaryTranslations.use_english.tr,
              ),
              value: settingsController.useEnglishEnabled.value,
              onChanged: (value) {
                settingsController.toggleLanguageEnabled();
              },
            ),
          ),
        ],
      ),
    );
  }
}
