import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/diary_model.dart';

class DiaryDatabase {
  static final DiaryDatabase instance = DiaryDatabase._init();
  static Database? _database;

  DiaryDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('driftbottlediary.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final dateType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tableDiary ( 
        ${DiaryFields.id} $idType, 
        ${DiaryFields.feelingLevel} $textType,
        ${DiaryFields.title} $textType,
        ${DiaryFields.content} $textType,
        ${DiaryFields.date} $dateType
      )
    ''');
  }

  Future<void> deleteTable(Database db, String tableName) async {
    await db.execute('DROP TABLE IF EXISTS $tableName');
  }

  Future<Diary> create(Diary diary) async {
    final db = await instance.database;
    final id = await db.insert(tableDiary, diary.toJson());
    return diary.copyWith(id: id);
  }

  Future<Diary> read(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableDiary,
      columns: DiaryFields.getFields(),
      where: '${DiaryFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Diary.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Diary>> readAll() async {
    final db = await instance.database;
    final orderBy = '${DiaryFields.date} DESC';
    final result = await db.query(tableDiary, orderBy: orderBy);
    return result.map((map) => Diary.fromJson(map)).toList();
  }

  Future<int> update(Diary diary) async {
    final db = await instance.database;
    return db.update(
      tableDiary,
      diary.toJson(),
      where: '${DiaryFields.id} = ?',
      whereArgs: [diary.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableDiary,
      where: '${DiaryFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

const String tableDiary = 'table_diary';

class DiaryFields {
  static const String id = '_id';
  static const String feelingLevel = 'feeling_level';
  static const String title = 'title';
  static const String content = 'content';
  static const String date = 'date';

  static List<String> getFields() => [id, feelingLevel, title, content, date];
}
