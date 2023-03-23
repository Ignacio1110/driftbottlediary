import 'package:driftbottlediary/screens/diary/edit_diary_sheet.dart';
import 'package:driftbottlediary/screens/diary/add_diary_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/diary_bottomsheet.dart';
import 'diary_detail_sheet.dart';
import '../../components/mood_picker.dart';
import '../../models/diary_model.dart';

class EditDiaryController extends GetxController {
  EditDiaryController({this.diary}) {
    if (diary != null) {
      titleController.text = diary!.title;
      contentController.text = diary!.content;
      selectedMood.value = diary!.feelingLevel;
    }
  }
  Diary? diary;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final Rx<Mood> selectedMood = Mood.happy.obs;

  static Future<dynamic> openDiarySheet({Diary? diary}) async {
    return Navigator.of(Get.context!).push(
      DiaryModalBottomSheetRoute(
        builder: (_) => EditDiarySheet(
          diary: diary,
        ),
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0),
            topRight: Radius.circular(32.0),
            bottomLeft: Radius.circular(32.0),
            bottomRight: Radius.circular(32.0),
          ),
        ),
      ),
    );
  }

  saveDiary() {
    Mood mood = selectedMood.value;
    String title = titleController.text;
    String content = contentController.text;
    if (diary != null) {
      Diary editedDiary = diary!.copyWith(
        feelingLevel: mood,
        title: title,
        content: content,
      );
      Get.back(result: editedDiary);
    } else {
      Diary diary = Diary(
          feelingLevel: mood,
          title: title,
          content: content,
          date: DateTime.now());
      Get.back(result: diary);
    }
  }
}
