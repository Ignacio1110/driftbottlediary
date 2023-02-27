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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'TW'),
      ],
      initialRoute: AppRoutes.SPLASHPAGE,
      getPages: [
        GetPage(
          name: AppRoutes.SPLASHPAGE,
          page: () => SplashPage(),
        ),
        GetPage(
          name: AppRoutes.HOME,
          page: () => MyHomePage(),
        ),
        // GetPage(
        //   name: AppRoutes.LOGIN,
        //   page: () => LoginScreen(),
        // ),
        // GetPage(
        //   name: AppRoutes.SIGNUP,
        //   page: () => SignupScreen(),
        // ),
        // GetPage(
        //   name: AppRoutes.PROFILE,
        //   page: () => ProfileScreen(),
        // ),
      ],
    );
  }
}
