import 'package:driftbottlediary/components/dialogs.dart';
import 'package:driftbottlediary/diary_theme.dart';
import 'package:driftbottlediary/shared_module/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rive/rive.dart';

import '../../components/anim.dart';
import '../../shared_module/admob_service.dart';
import '../../translations.dart';
import 'curve.dart';
import 'settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Get.put(SettingsController());
    final buttonStyle = TextButton.styleFrom(
        backgroundColor: DiaryTheme.kSecondary,
        foregroundColor: DiaryTheme.black);
    final buttonDeleteStyle = TextButton.styleFrom(
        backgroundColor: DiaryTheme.red, foregroundColor: DiaryTheme.black);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BezierCurve(
            child: SafeArea(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                child: Obx(
                  () => Center(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        controller.user.value == null
                            ? GestureDetector(
                                onTap: () {
                                  controller.goToSignIn();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DiaryTranslations.login_to_upload_data.tr,
                                      style: textTheme.titleMedium,
                                    ),
                                    const Icon(Icons.chevron_right),
                                  ],
                                ),
                              )
                            : Text(
                                '${controller.user.value!.displayName}',
                              ),
                      ],
                    ),
                  ),
                ),
              )),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
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
            () => controller.user.value == null
                ? const SizedBox()
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                    child: TextButton(
                      style: buttonStyle,
                      onPressed: () {
                        controller.uploadDiaryToCloud();
                      },
                      child: Center(
                        child: Text(
                          DiaryTranslations.upload_data.tr,
                        ),
                      ),
                    ),
                  ),
          ),
          Obx(
            () => controller.user.value == null
                ? const SizedBox()
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                    child: TextButton(
                      style: buttonStyle,
                      onPressed: () {
                        controller.downloadDiaryFromCloud();
                      },
                      child: Center(
                        child: Text(
                          DiaryTranslations.download_data.tr,
                          // DiaryTranslations.upload_data.tr,
                        ),
                      ),
                    ),
                  ),
          ),
          Obx(
            () => controller.user.value == null
                ? const SizedBox()
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                    child: TextButton(
                      style: buttonStyle,
                      onPressed: () {
                        Get.find<FirebaseAuthService>().signOut();
                      },
                      child: Center(
                        child: Text(
                          DiaryTranslations.signOut.tr,
                        ),
                      ),
                    ),
                  ),
          ),
          Obx(
            () => controller.user.value == null
                ? const SizedBox()
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                    child: TextButton(
                      style: buttonDeleteStyle,
                      onPressed: () async {
                        final result = await Get.customDialog(
                          simpleDialog(
                            title: DiaryTranslations.deleteAccount.tr,
                            content: '',
                          ),
                          animType: AnimType.rightSlide,
                        );
                        if (result == true) {
                          Get.find<FirebaseAuthService>().deleteAccount();
                        }
                      },
                      child: Center(
                        child: Text(
                          DiaryTranslations.deleteAccount.tr,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
