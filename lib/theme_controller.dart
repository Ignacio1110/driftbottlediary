import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'diary_theme.dart';

class ThemeController extends GetxController {
  final isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;

    Get.changeThemeMode(
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
    );
  }

  ThemeData getTheme() {
    return isDarkMode.value ? DiaryTheme.darkTheme : DiaryTheme.lightTheme;
  }
}
