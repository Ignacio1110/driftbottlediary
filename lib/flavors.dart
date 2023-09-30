import 'dart:io';

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
}
