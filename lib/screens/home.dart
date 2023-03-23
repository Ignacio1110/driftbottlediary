import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../translations.dart';
import 'bottom_nav_bar.dart';
import 'bottom_nav_controller.dart';
import 'diary/diary_page.dart';
import 'float_action_controller.dart';
import 'floating_action_view.dart';
import 'settings/setting_page.dart';

class MyHomePage extends GetView<BottomNavController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    Get.put(FloatingActionController());
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            DiaryPage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(),
        floatingActionButton: const FloatingActionView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      ),
    );
  }
}
