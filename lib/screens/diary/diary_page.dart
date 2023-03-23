import 'package:driftbottlediary/components/diary_card.dart';
import 'package:driftbottlediary/shared_module/admob_service.dart';
import 'package:driftbottlediary/shared_module/cached_image_controller.dart';
import 'package:driftbottlediary/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../components/diary_bottomsheet.dart';
import 'diary_detail_controller.dart';
import 'diary_detail_sheet.dart';
import 'diary_page_controller.dart';

class DiaryPage extends GetView<DiaryPageController> {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DiaryPageController());
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(DiaryTranslations.app_title.tr),
                  // expandedHeight: 100.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Get.find<CachedImageController>().bottleImage,
                  ),
                  actions: [
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(right: 16),
                    //     child: ElevatedButton.icon(
                    //       onPressed: () {
                    //         controller.addDiary();
                    //       },
                    //       icon: Icon(Icons.add),
                    //       label: Text('寫心情'),
                    //       style: ElevatedButton.styleFrom(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius:
                    //               BorderRadius.circular(kTextTabBarHeight),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Obx(() {
                  final _diaries = controller.diaries;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final diary = _diaries[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DiaryCard(
                            diary: diary,
                            onTap: () async {
                              await Navigator.of(context).push(
                                DiaryModalBottomSheetRoute(
                                  builder: (_) =>
                                      DiaryDetailBottomSheet(diary: diary),
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      childCount: _diaries.length,
                    ),
                  );
                }),
                const SliverToBoxAdapter(
                  child: Divider(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        DiaryTranslations.app_diary_foreword.tr,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            BannerAd? ad = Get.find<AdMobService>().bannerAd.value;
            return ad == null
                ? const SizedBox()
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: ad.size.width.toDouble(),
                          height: ad.size.height.toDouble(),
                          child: AdWidget(ad: ad)),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
