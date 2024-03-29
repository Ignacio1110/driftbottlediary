import 'package:driftbottlediary/screens/auth_pages/login_page.dart';
import 'package:driftbottlediary/screens/splash_page.dart';
import 'package:driftbottlediary/translations.dart';
import 'package:driftbottlediary/utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';
import 'screens/home.dart';
import 'theme_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('zh-TW', ZHMessages());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
        GetPage(
          name: AppRoutes.LOGIN,
          page: () => const LoginPage(),
        ),
      ],
    );
  }
}
