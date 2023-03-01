import 'package:driftbottlediary/screens/diary/add_diary_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/mood_picker.dart';
import 'diary_model.dart';

class AddDiaryController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final Rx<Mood> selectedMood = Mood.happy.obs;
  Future<dynamic> openNewDiaryDialog() async {
    return await Get.dialog(AddDiaryDialog());
  }

  saveDiary() {
    Mood mood = selectedMood.value;
    String title = titleController.text;
    String content = contentController.text;
    Diary diary = Diary(
        feelingLevel: mood,
        title: title,
        content: content,
        date: DateTime.now());
    Get.back(result: diary);
  }
}
