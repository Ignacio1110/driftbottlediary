import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // Add a delay to simulate a long-running operation
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next page
      Get.offNamed('/home');
    });
  }
}
