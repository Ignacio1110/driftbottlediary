import 'package:driftbottlediary/components/handle_bar.dart';
import 'package:driftbottlediary/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../components/custom_sliver_persistent_header_delegate.dart';
import '../../consts.dart';
import 'diary_detail_controller.dart';

class DiaryDetailBottomSheet extends GetView<DiaryDetailController> {
  const DiaryDetailBottomSheet({super.key, required this.diary});

  final Diary diary;
  @override
  Widget build(BuildContext context) {
    Get.put(DiaryDetailController(diary: diary));
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const HandleBar(),
        Expanded(
          child: Obx(
            () => RawScrollbar(
              thumbVisibility: true,
              padding: const EdgeInsets.only(top: 56),
              child: CustomScrollView(
                slivers: [
                  //上方動作列
                  SliverPersistentHeader(
                    delegate: CustomSliverPersistentHeaderDelegate(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kBottomSheetPadding),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.edit();
                                    },
                                    icon: const FaIcon(
                                      FontAwesomeIcons.filePen,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.shareNodes,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.delete();
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.trashCan,
                                color: kWarningColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    pinned: true,
                  ),
                  //摘要
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: kBottomSheetPadding,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: FittedBox(
                                child: FaIcon(
                                  controller.currentDiary.value.feelingLevel
                                      .getMoodIcon(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            child: Text(
                              controller.currentDiary.value.title,
                              style: textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Divider(),
                  ),
                  //詳細內容
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: kBottomSheetPadding,
                      ),
                      child: Text(
                        controller.currentDiary.value.content,
                        style: textTheme.titleLarge,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
