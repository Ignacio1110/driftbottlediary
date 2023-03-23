import 'package:driftbottlediary/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/mood_picker.dart';
import 'edit_diary_controller.dart';

@Deprecated('舊設計')
class AddDiaryDialog extends GetView<EditDiaryController> {
  const AddDiaryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(DiaryTranslations.new_diary.tr),
      content: SizedBox(
        height: Get.height * .4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => MoodPicker(
                selectedMood: controller.selectedMood.value,
                onChange: (Mood mood) {
                  controller.selectedMood.value = mood;
                },
              ),
            ),
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: controller.contentController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Content',
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(DiaryTranslations.cancel.tr),
        ),
        ElevatedButton(
          onPressed: () {
            controller.saveDiary();
          },
          child: Text(DiaryTranslations.save.tr),
        ),
      ],
    );
  }
}
