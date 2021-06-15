import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:io';

class DBHelper {
  // Table Name : bookdata
  // items : id, book, author, current, total

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database _database;

  Future<Database> database() async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();

      return _database;
    }
  }

  _initDatabase() async {
    Directory dbPath = await getApplicationDocumentsDirectory();
    String path = join(dbPath.path, 'bookdataDB.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);

    /*
    return _database.openDatabase(path.join(dbPath, 'bookdataDB.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE bookdata(id TEXT PRIMARY KEY, book TEXT, author TEXT, current TEXT, total TEXT)');
    }, version: 1);
    */
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE bookdata(id TEXT PRIMARY KEY, book TEXT, author TEXT, current TEXT, total TEXT)');
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    Database db = await instance.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData(String table) async {
    Database db = await instance.database();
    return db.query(table);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database();
    String idch = row['id'];
    return await db.update('bookdata', row, where: 'id = ?', whereArgs: [idch]);
  }

  Future<int> delete(String id) async {
    Database db = await instance.database();
    return await db.delete('bookdata', where: 'id = ?', whereArgs: [id]);
  }
}
