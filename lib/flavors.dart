import 'dart:io';

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

import 'shared_module/admob_service.dart';

enum Flavor {
  ENV_PROD,
  ENV_DEV,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.ENV_PROD:
        return 'Drift Bottle Diary';
      case Flavor.ENV_DEV:
        return 'Dev Drift Bottle Diary';
      default:
        return 'title';
    }
  }

  //廣告
  static String get bannerId {
    switch (appFlavor) {
      case Flavor.ENV_PROD:
        return Platform.isAndroid
            //從dart define的值中取得正式環境的廣告id
            ? const String.fromEnvironment('GOOGLE_MOBILE_AD_ID_ANDROID_BANNER')
            //從dart define的值中取得正式環境的廣告id
            : const String.fromEnvironment('GOOGLE_MOBILE_AD_ID_IOS_BANNER');
      default:
        return Platform.isAndroid
            //官方提供的測試banner id 'ca-app-pub-3940256099942544/6300978111'
            ? const String.fromEnvironment('GOOGLE_MOBILE_AD_ID_ANDROID_BANNER')
            // 官方提供的測試banner id 'ca-app-pub-3940256099942544/2934735716';
            : const String.fromEnvironment('GOOGLE_MOBILE_AD_ID_IOS_BANNER');
    }
  }

  static String get interstitialId {
    switch (appFlavor) {
      case Flavor.ENV_PROD:
        return 'paste your id';
      default:
        return Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910';
    }
  }

  static String get rewardedId {
    switch (appFlavor) {
      case Flavor.ENV_PROD:
        return 'paste your id';
      default:
        return Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/1712485313';
    }
  }

  static FirebaseOptions get firebaseOptions {
    switch (appFlavor) {
      case Flavor.ENV_PROD:
        return Platform.isAndroid ? androidProd : iosProd;
      default:
        return Platform.isAndroid ? androidDev : iosDev;
    }
  }

  //firebase
  static const FirebaseOptions androidDev = FirebaseOptions(
    apiKey: String.fromEnvironment('FIREBASE_API_KEY_ANDROID'),
    appId: '1:681570670467:android:f441c3711f7f010b8d48b6',
    messagingSenderId: '681570670467',
    projectId: 'driftbottlediary-dev',
    storageBucket: 'driftbottlediary-dev.appspot.com',
  );

  static const FirebaseOptions iosDev = FirebaseOptions(
    apiKey: String.fromEnvironment('FIREBASE_API_KEY_IOS'),
    appId: '1:681570670467:ios:2322b8da05b143d88d48b6',
    messagingSenderId: '681570670467',
    projectId: 'driftbottlediary-dev',
    storageBucket: 'driftbottlediary-dev.appspot.com',
    iosClientId:
        '681570670467-9g87oefuq1fcdsg237oqem5vtuaanq3q.apps.googleusercontent.com',
    iosBundleId: 'com.ignaciozhang85.driftbottlediary.dev',
  );

  static const FirebaseOptions androidProd = FirebaseOptions(
    apiKey: String.fromEnvironment('FIREBASE_API_KEY_ANDROID'),
    appId: '1:913191307011:android:4bf85238fbdf6e30c38b36',
    messagingSenderId: '913191307011',
    projectId: 'driftbottlediary',
    storageBucket: 'driftbottlediary.appspot.com',
  );

  static const FirebaseOptions iosProd = FirebaseOptions(
    apiKey: String.fromEnvironment('FIREBASE_API_KEY_IOS'),
    appId: '1:913191307011:ios:01cf029fdd166333c38b36',
    messagingSenderId: '913191307011',
    projectId: 'driftbottlediary',
    storageBucket: 'driftbottlediary.appspot.com',
    iosClientId:
        '913191307011-rfliifmcqqu9qcdhhlfgkb3j2v73kvu8.apps.googleusercontent.com',
    iosBundleId: 'com.ignaciozhang85.driftbottlediary.prod',
  );
}
