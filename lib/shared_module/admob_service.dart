import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService extends GetxService {
  late BannerAd bannerAd;

  Future<void> initialize() async {
    final adUnitId = '<your_ad_unit_id_here>';
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(onAdClosed: (_) => dispose()),
    );
    await bannerAd.load();
  }

  void dispose() {
    bannerAd.dispose();
  }
}
