import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CachedImageController extends GetxController {
  Image bottleImage = Image.asset(
    'assets/images/bottle.jpg',
    fit: BoxFit.cover,
    alignment: Alignment.centerLeft,
  );

  cacheImage() {
    precacheImage(bottleImage.image, Get.context!);
  }

  @override
  void onReady() {
    super.onReady();
  }
}
