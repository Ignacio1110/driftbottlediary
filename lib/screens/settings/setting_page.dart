import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../translations.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
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
                value: settingsController.useEnglishEnabled.value,
                onChanged: (value) {
                  settingsController.toggleLanguageEnabled();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
