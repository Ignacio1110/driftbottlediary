import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'app.dart';
import 'screens/bottom_nav_controller.dart';
import 'shared_module/cached_image_controller.dart';
import 'theme_controller.dart';

const kDebugSQLite = true;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugSQLite) {
    Sqflite.setDebugModeOn();
  }

  Get.put(BottomNavController());
  Get.put(ThemeController());
  Get.put(CachedImageController());
  runApp(const MyApp());
}
