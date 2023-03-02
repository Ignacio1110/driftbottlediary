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

}
