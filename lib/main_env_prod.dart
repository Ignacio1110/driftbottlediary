import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sqflite/sqflite.dart';
import 'myapp.dart';
import 'screens/bottom_nav_controller.dart';
import 'shared_module/admob_service.dart';
import 'shared_module/cached_image_controller.dart';
import 'theme_controller.dart';
import 'flavors.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const kDebugSQLite = false;

void main() async {
  F.appFlavor = Flavor.ENV_PROD;
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugSQLite) {
    Sqflite.setDebugModeOn();
  }

  final adMobService = AdMobService();
  await adMobService.initialize();
  Get.put(adMobService);
  Get.put(BottomNavController());
  Get.put(ThemeController());
  Get.put(CachedImageController());
  runApp(const MyApp());
}
