import 'package:driftbottlediary/components/mood_picker.dart';
import 'package:driftbottlediary/screens/diary/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDiaryController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final Rx<Mood> selectedMood = Mood.happy.obs;
  Future<dynamic> openNewDiaryDialog() async {
    return await Get.dialog(
      AlertDialog(
        title: Text('New Diary'),
        content: SizedBox(
          height: Get.height * .4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => MoodPicker(
                  selectedMood: selectedMood.value,
                  onChange: (Mood mood) {
                    selectedMood.value = mood;
                  },
                ),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: TextField(
                  controller: contentController,
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
              saveDiary();
            },
            child: Text('SAVE'),
          ),
        ],
      ),
    );
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
