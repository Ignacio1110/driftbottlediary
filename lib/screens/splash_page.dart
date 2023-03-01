import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Get.size.shortestSide * .3,
          height: Get.size.shortestSide * .3,
          child: ClipRect(
            child: OverflowBox(
              maxWidth: Get.size.shortestSide * .4,
              maxHeight: Get.size.shortestSide * .4,
              minHeight: Get.size.shortestSide * .4,
              minWidth: Get.size.shortestSide * .4,
              child: Image.asset(
                'assets/icons/icon.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
