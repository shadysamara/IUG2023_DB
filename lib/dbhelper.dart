import 'dart:developer';
import 'dart:io';

import 'package:iug_local_storage/student.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static late Database database;
  static initDb() async {
    String path = await getDatabasesPath();
    String databasePath = path + "/vp.db";
    database = await openDatabase(databasePath, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE Students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, Gender TEXT , Gpa INT)');
    });
  }

  static insertNewStudent(Student student) async {
    int rowIndex = await database.insert('Students', student.toMap());
    log(rowIndex.toString());
  }

  static Future<List<Map<String, dynamic>>> getAllStudents() async {
    List<Map<String, dynamic>> results = await database.query('Students');
    return results;
  }

  static deleteStudent(int id) async {
    await database.delete('Students', where: "id=$id");
  }

  static updateStudent() async {}
}
