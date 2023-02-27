import 'package:driftbottlediary/screens/splash_page.dart';
import 'package:driftbottlediary/translations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';
import 'screens/home.dart';
import 'theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: DiaryTranslations.app_title.tr,
      theme: Get.find<ThemeController>().getTheme(),
      locale: const Locale('zh', 'TW'),
      translations: DiaryTranslations(),
      fallbackLocale: const Locale('zh', 'TW'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'TW'),
      ],
      initialRoute: AppRoutes.SPLASHPAGE,
      getPages: [
        GetPage(
          name: AppRoutes.SPLASHPAGE,
          page: () => const SplashPage(),
        ),
        GetPage(
          name: AppRoutes.HOME,
          page: () => const MyHomePage(),
        ),
      ],
    );
  }
}
