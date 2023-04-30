import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String direPath = directory.path;
    String dbName = "tasks.db";
    String dbPath = direPath + "/$dbName";
    database = await openDatabase(dbPath, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE Tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isComplete INTEGER)');
    });
  }
}
