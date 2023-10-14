import 'package:get/get.dart';

import '../shared_module/auth_service.dart';

class SplashController extends GetxController {
  //檢查登入狀態
  fetchUserInfo() async {
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next page

      Get.offNamed('/home');
    });
  }

  @override
  void onReady() {
    super.onReady();
    // Add a delay to simulate a long-running operation

    fetchUserInfo();
  }
}
