import 'dart:developer';

import 'package:iug_local_storage/mvc/models/student.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper();
  late Database database;
  initDb() async {
    String dirPath = await getDatabasesPath();
    String dbPath = dirPath + "/iug_flutter.db";
    database = await openDatabase(dbPath, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isMale INTEGER, gpa REAL)');
    });
  }

  Future<bool> insertNewStudent(Student student) async {
    try {
      int rowId = await database.insert('students', student.toMap());
      log(rowId.toString());
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  Future<List<Student>> getAllStudent() async {
    List<Map> results = await database.query('students');
    List<Student> students = results.map((e) => Student.fromMap(e)).toList();
    return students;
  }

  deleteStuent(int id) async {
    database.delete('students', where: 'id=$id');
  }

  updateStudent(Student newStudent) async {
    database.update('students', newStudent.toMap(), where: 'id=${newStudent.id}');
  }
}
