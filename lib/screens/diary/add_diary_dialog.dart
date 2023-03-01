import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/mood_picker.dart';
import 'add_diary_controller.dart';

class AddDiaryDialog extends GetView<AddDiaryController> {
  const AddDiaryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Diary'),
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
          child: Text('CANCEL'),
        ),
        ElevatedButton(
          onPressed: () {
            controller.saveDiary();
          },
          child: Text('SAVE'),
        ),
      ],
    );
  }
}
