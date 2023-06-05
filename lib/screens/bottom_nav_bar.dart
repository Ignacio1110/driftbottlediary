import 'package:driftbottlediary/consts.dart';
import 'package:driftbottlediary/screens/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView<BottomNavController> {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(
      () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "日記", //TODO
              icon: const FaIcon(
                FontAwesomeIcons.bookQuran,
                size: 30,
              ),
            ),
            BottomNavigationBarItem(
              label: "設定", //TODO
              icon: const FaIcon(
                Icons.settings,
                size: 30,
              ),
            ),
          ]),
    );
  }
}
