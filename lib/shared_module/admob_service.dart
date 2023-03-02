import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../flavors.dart';

class AdMobService extends GetxService {
  late final adUnitBannerId;

  Future<void> initialize() async {
    InitializationStatus status = await _initGoogleMobileAds();
    adUnitBannerId = F.bannerId;
  }

  ///Initialize Google Mobile Ads SDK
  Future<InitializationStatus> _initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  Rxn<BannerAd?> _bannerAd = Rxn<BannerAd?>();

  Rxn<BannerAd?> get bannerAd => _bannerAd;

  /// Loads a banner ad.
  void loadBannerAd() {
    BannerAd(
      adUnitId: adUnitBannerId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          _bannerAd.value = ad as BannerAd;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd $ad failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    ).load();
  }

  //should dispose when it dispear?
  void dispose() {
    _bannerAd.value?.dispose();
  }
}
