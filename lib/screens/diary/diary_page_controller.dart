import 'package:driftbottlediary/screens/diary/edit_diary_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared_module/admob_service.dart';
import '../../shared_module/diary_repository.dart';
import '../../models/diary_model.dart';

class DiaryPageController extends GetxController {
  final RxList<Diary> diaries = <Diary>[].obs;
  final Rxn<Diary?> currentDiary = Rxn<Diary?>(); //not useful

  final DiaryRepository _repository = DiaryRepository.instance;
  final GetStorage _storage = GetStorage();

  //TODO 分頁 in future

  ///add new diary
  ///新增日誌
  addDiary() async {
    final dynamic result = await EditDiaryController.openDiarySheet();
    if (result is Diary) {
      final entryId = await _repository.insertDiaryEntry(result);
      Diary newDiary = result.copyWith(id: entryId);
      diaries.insert(0, newDiary);
      diaries.refresh();
      currentDiary.value = newDiary;
      _storage.write('last_entry_id', entryId);
    }
  }

  //更新日誌
  Future<void> updateDiary(Diary? diary) async {
    if (diary != null) {
      int index = diaries.indexWhere((element) => element.id == diary.id);
      if (index == -1) return;
      await _repository.updateDiaryEntry(diary);
      currentDiary.value = diary;

      diaries.removeAt(index);
      diaries.insert(index, diary);
      diaries.refresh();
    }
  }

  //刪除日誌
  Future<void> deleteEntry(int id) async {
    await _repository.deleteDiaryEntry(id);
    diaries.removeWhere((entry) => entry.id == id);
    if (currentDiary.value?.id == id) {
      currentDiary.value = null;
      _storage.remove('last_entry_id');
    }
  }

  //delete table test
  Future deleteTable() async {
    await _repository.deleteTable();
  }

  ///取得所有資料庫中的日記
  Future<void> _loadEntries() async {
    final entriesFromDb = await _repository.getAllDiaryEntries();
    diaries.assignAll(entriesFromDb);
  }

  ///取得最新一筆日記
  Future<void> _loadCurrentEntry() async {
    final lastEntryId = _storage.read('last_entry_id') as int?;
    if (lastEntryId != null) {
      final entryFromDb = await _repository.getDiaryEntry(lastEntryId);
      currentDiary.value = entryFromDb;
    }
  }

  @override
  void onInit() async {
    await _loadEntries();
    await _loadCurrentEntry();
    Get.find<AdMobService>().loadBannerAd();
    super.onInit();
  }
}
