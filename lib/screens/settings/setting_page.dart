import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rive/rive.dart';

import '../../shared_module/admob_service.dart';
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
            Obx(
              () {
                BannerAd? ad = Get.find<AdMobService>().bannerAd.value;
                return ad == null
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: ad.size.width.toDouble(),
                            height: ad.size.height.toDouble(),
                            child: AdWidget(ad: ad)),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
