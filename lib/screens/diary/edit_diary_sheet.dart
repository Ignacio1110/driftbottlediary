import 'package:driftbottlediary/models/diary_model.dart';
import 'package:driftbottlediary/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/mood_picker.dart';
import '../../consts.dart';
import 'edit_diary_controller.dart';
import '../../components/handle_bar.dart';

class EditDiarySheet extends GetView<EditDiaryController> {
  const EditDiarySheet({super.key, this.diary});

  final Diary? diary;

  @override
  Widget build(BuildContext context) {
    Get.put(EditDiaryController(diary: diary));
    return Column(
      children: [
        const HandleBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: kBottomSheetPadding,
              ),
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
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    // scrollPhysics: NeverScrollableScrollPhysics(),
                    controller: controller.contentController,
                    expands: false,
                    maxLines: 100,
                    minLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Content',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: kBottomSheetPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
          ),
        ),
      ],
    );
  }
}
