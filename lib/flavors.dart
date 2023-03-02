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
            ? 'ca-app-pub-your------ id'
            : 'ca-app-pub-your------- id';
      default:
        return Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/6300978111'
            : 'ca-app-pub-3940256099942544/2934735716';
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
