import 'package:driftbottlediary/screens/diary/diary_model.dart';
import 'package:driftbottlediary/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'diary_page_controller.dart';

class DiaryPage extends GetView<DiaryPageController> {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DiaryPageController());
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(DiaryTranslations.app_title.tr),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/bottle.jpeg',
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      controller.addDiary();
                    },
                    icon: Icon(Icons.add),
                    label: Text('寫心情'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kTextTabBarHeight),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(() {
            final _diaries = controller.diaries;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final diary = _diaries[index];
                  return ListTile(
                    title: Text(diary.title),
                    subtitle: Text(
                        '${diary.date.day}-${diary.date.month}-${diary.date.year}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // TODO: Navigate to the detail page
                    },
                  );
                },
                childCount: _diaries.length,
              ),
            );
          }),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                // controller.deleteTable();
              },
              child: Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
