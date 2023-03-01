import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../translations.dart';
import 'bottom_nav_controller.dart';
import 'diary/diary_page.dart';
import 'settings/setting_page.dart';

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
            // Center(
            //   child: Text("2"),
            // ),
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
              icon: const FaIcon(FontAwesomeIcons.bookQuran),
              label: DiaryTranslations.drift_bottle.tr,
            ),
            // BottomNavigationBarItem(
            //   icon: const Icon(Icons.note),
            //   label: DiaryTranslations.note.tr,
            // ),
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
