import 'package:driftbottlediary/screens/diary/edit_diary_controller.dart';
import 'package:driftbottlediary/screens/diary/diary_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/anim.dart';
import '../../components/dialogs.dart';
import '../../components/diary_bottomsheet.dart';
import '../../models/diary_model.dart';
import 'edit_diary_sheet.dart';

class DiaryDetailController extends GetxController {
  DiaryDetailController({required Diary diary}) {
    currentDiary = diary.obs;
  }
  late Rx<Diary> currentDiary;

  edit() async {
    Diary diary = currentDiary.value;
    print("diary : ${diary.id}");
    final result = await EditDiaryController.openDiarySheet(diary: diary);
    if (result != null && result is Diary) {
      print(result);
      final diaryPageController = Get.put(DiaryPageController());
      await diaryPageController.updateDiary(result);
      currentDiary.value = result;
    }
  }

  delete() async {
    Get.customDialog(
      simpleDeleteDialog(
        Get.context!,
        confirm: () {
          Diary diary = currentDiary.value;
          final diaryPageController = Get.put(DiaryPageController());
          if (diary.id == null) return;
          diaryPageController.deleteEntry(diary.id!);
          Get.back();
        },
      ),
      animType: AnimType.rightSlide,
    );
  }
}
