import 'package:flutter/foundation.dart';

import '../models/diary_model.dart';
import 'diary_database.dart';
import 'firebase_repository.dart';

class DiaryRepository {
  static final DiaryRepository instance = DiaryRepository._init();

  static final DiaryDatabase _localDatabase = DiaryDatabase.instance;

  static final FirebaseRepository _cloudDatabase = FirebaseRepository.instance;

  DiaryRepository._init();

  Future<int> insertDiaryEntry(Diary entry) async {
    final Diary diary = await _localDatabase.create(entry);
    return diary.id!;
  }

  Future<List<Diary>> getAllDiaryEntries() async {
    final result = await _localDatabase.readAll();
    return result;
  }

  Future<Diary> getDiaryEntry(int id) async {
    return await _localDatabase.read(id);
  }

  Future<void> updateDiaryEntry(Diary entry) async {
    final db = await _localDatabase.update(entry);
  }

  Future<void> updateDiaryEntryByDate(Diary entry) async {
   await _localDatabase.updateOrInsertByDate(entry);
  }

  Future<void> deleteDiaryEntry(int id) async {
    await _localDatabase.delete(id);
    await _cloudDatabase.deleteDiary(id.toString());
    return;
  }

  Future<void> deleteTable() async {
    await _localDatabase.deleteTable(await _localDatabase.database, tableDiary);
  }

  ///上傳並覆蓋所有的日記紀錄
  Future<void> uploadAllDiary() async {
    List<Diary> diaries = await getAllDiaryEntries();
    await _cloudDatabase.uploadAllDiary(diaries.toList());
    await Future.wait(
        diaries.map((e) => updateDiaryEntry(e.copyWith(uploaded: 1))).toList());
  }

  ///下載所有的日記紀錄
  Future<void> downloadAllDiary() async {
    List<Diary>  diaries = await _cloudDatabase.downloadAllDiary();
    if(kDebugMode)print(diaries);
    await Future.wait(
        diaries.map((e) => updateDiaryEntryByDate(e.copyWith(uploaded: 1))).toList());
  }
}
