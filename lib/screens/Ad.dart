import 'dart:io' show Platform;
import 'package:firebase_admob/firebase_admob.dart';

class FirebaseAdMobManager {
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  String appID = Platform.isIOS
  // iOS Test App ID
      ? 'ca-app-pub-7875242624363574~6244191252'
  // Android Test App ID
      : 'ca-app-pub-7875242624363574~6244191252';
  String bannerID = BannerAd.testAdUnitId;
  String interstitialID = InterstitialAd.testAdUnitId;

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutter', 'firebase', 'admob'],
    testDevices: <String>[],
  );

  init() async {
    FirebaseAdMob.instance.initialize(appId: appID);
    _bannerAd = createBannerAd();
    _interstitialAd = createInterstitialAd();
//    _bannerAd..load()..show();
  }

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: bannerID,
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd event is $event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: interstitialID,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd event is $event");
        });
  }

  showInterstitialAd() {
    _interstitialAd..load()..show();

  }
  showbannerAd(){
    _bannerAd..load()..show();

  }
  removeAd(){
    _bannerAd?.dispose();

    _bannerAd = null;
  }
  removeInterstitialAd(){
    _interstitialAd.dispose();
    _bannerAd = null;
  }
}