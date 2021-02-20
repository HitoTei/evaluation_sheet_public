import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDatabase {
  factory SqlDatabase() => _cache ??= SqlDatabase._internal();

  SqlDatabase._internal() {
    database = _createDatabase();
  }

  Future<Database> database;

  static SqlDatabase _cache;
  static const sheetTable = 'sheet_table';
  static const evaluationTable = 'evaluation_table';

  Future<Database> _createDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'coffee_life_manager.db'),
      version: 2,
      onCreate: (Database db, int version) async {
        _createSheetTable(db, version);
        _createEvaluationTable(db, version);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion == 1) {
          log('on upgrade was called');
          await db.execute('ALTER TABLE $sheetTable ADD COLUMN tag TEXT;'
              'ALTER TABLE $sheetTable ADD COLUMN sumPoint INTEGER;');
        }
      },
    );
  }

  Future<void> _createSheetTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $sheetTable(
      uid INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      tag TEXT,
      sumPoint INTEGER
    );
    ''');
  }

  Future<void> _createEvaluationTable(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $evaluationTable(
      uid INTEGER PRIMARY KEY AUTOINCREMENT,
      sheetId INTEGER,
      comment TEXT,
      rate INTEGER
    );
    ''');
  }
}
