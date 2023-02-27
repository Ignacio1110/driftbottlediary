import 'package:driftbottlediary/screens/diary/diary_page.dart';
import 'package:driftbottlediary/screens/settings/setting_page.dart';
import 'package:driftbottlediary/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'bottom_nav_controller.dart';

class MyHomePage extends GetView<BottomNavController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [
            DiaryPage(),
            Center(
              child: Text("2"),
            ),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.mood_sharp),
              label: DiaryTranslations.drift_bottle.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.note),
              label: DiaryTranslations.note.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: DiaryTranslations.settings.tr,
            ),
          ],
        ),
      ),
    );
  }
}
