import 'package:get/get.dart';

import 'diary/diary_page_controller.dart';

class FloatingActionController extends GetxController {
  final diaryPageController = Get.put(DiaryPageController());

  addDiary() {
    diaryPageController.addDiary();
  }
}
