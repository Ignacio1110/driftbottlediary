import '../models/diary_model.dart';
import 'diary_database.dart';

class DiaryRepository {
  static final DiaryRepository instance = DiaryRepository._init();

  static final DiaryDatabase _database = DiaryDatabase.instance;

  DiaryRepository._init();

  Future<int> insertDiaryEntry(Diary entry) async {
    final Diary diary = await _database.create(entry);
    return diary.id!;
  }

  Future<List<Diary>> getAllDiaryEntries() async {
    final result = await _database.readAll();
    return result;
  }

  Future<Diary> getDiaryEntry(int id) async {
    return await _database.read(id);
  }

  Future<void> updateDiaryEntry(Diary entry) async {
    final db = await _database.update(entry);
  }

  Future<void> deleteDiaryEntry(int id) async {
    await _database.delete(id);
    return;
  }

  Future<void> deleteTable() async {
    await _database.deleteTable(await _database.database, tableDiary);
  }
}
