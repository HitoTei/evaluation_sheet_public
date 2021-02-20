import 'package:evaluation_sheet/model/evaluation.dart';
import 'package:evaluation_sheet/model/sheet.dart';
import 'package:evaluation_sheet/repository/sql_database.dart';
import 'package:sqflite/sqflite.dart';

class EvaluationDao {
  final _db = SqlDatabase().database;
  static const _table = SqlDatabase.evaluationTable;

  Future<List<Evaluation>> fetchBySheetId(int sheetId) async {
    final db = await _db;
    final list = await db.query(
      _table,
      where: 'sheetId = ?',
      whereArgs: [sheetId],
    );
    return list
        .map(
          (e) => Evaluation(
            uid: e['uid'],
            sheetId: e['sheetId'],
            comment: e['comment'],
            rate: e['rate'],
          ),
        )
        .toList()
          ..sort((a, b) => b.uid - a.uid);
  }

  Future<int> insert(Evaluation evaluation) async {
    final db = await _db;
    return db.insert(
      _table,
      {
        'uid': evaluation.uid,
        'sheetId': evaluation.sheetId,
        'comment': evaluation.comment,
        'rate': evaluation.rate,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> remove(Evaluation evaluation) async {
    final db = await _db;
    return db.delete(
      _table,
      where: 'uid = ?',
      whereArgs: [evaluation.uid],
    );
  }
}

class SheetDao {
  final _db = SqlDatabase().database;
  static const _table = SqlDatabase.sheetTable;

  Future<List<Sheet>> fetchAll() async {
    final db = await _db;
    final list = await db.query(
      _table,
    );
    return list
        .map((e) => Sheet(
              uid: e['uid'],
              title: e['title'],
              tag: e['tag'] ?? '',
              sumPoint: e['sumPoint'] ?? 0,
            ))
        .toList()
          ..sort((a, b) => b.uid - a.uid);
  }

  Future<Sheet> fetchByUid(int uid) async {
    final db = await _db;
    final list = await db.query(
      _table,
      where: 'uid = ?',
      whereArgs: [uid],
    );
    return list
        .map((e) => Sheet(
              uid: e['uid'],
              title: e['title'],
              tag: e['tag'] ?? '',
              sumPoint: e['sumPoint'] ?? 0,
            ))
        .toList()[0];
  }

  Future<int> insert(Sheet sheet) async {
    final db = await _db;
    return db.insert(
      _table,
      {
        'uid': sheet.uid,
        'title': sheet.title,
        'tag': sheet.tag ?? '',
        'sumPoint': sheet.sumPoint ?? 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateSumPoint(int uid, int sumPoint) async {
    final sheet = (await fetchByUid(uid)).copyWith(sumPoint: sumPoint);
    return insert(sheet);
  }

  Future<int> updateTag(int uid, String tag) async {
    final sheet = (await fetchByUid(uid)).copyWith(tag: tag);
    return insert(sheet);
  }

  Future<int> remove(Sheet sheet) async {
    final db = await _db;
    db.delete(
      SqlDatabase.evaluationTable,
      where: 'sheetId = ?',
      whereArgs: [sheet.uid],
    );
    return db.delete(
      _table,
      where: 'uid = ?',
      whereArgs: [sheet.uid],
    );
  }
}
