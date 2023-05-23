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

  Future<int> insertNewStudent(Student student) async {
    try {
      int rowId = await database.insert('students', student.toMap());
      return rowId;
    } on Exception catch (e) {
      return 0;
    }
  }

  Future<List<Student>> getAllStudent() async {
    List<Map<String, dynamic>> results = await database.query('students');
  
    List<Student> students = results.map((e) => Student.fromMap(e)).toList();
    return students;
  }

  Future<Student?> getOneStudent(int id) async {
    List<Map<String, dynamic>> results =
        await database.query('students', where: "id=?", whereArgs: [id]);
    if (results.length != 0) {
      Student student = Student.fromMap(results.first);
      return student;
    }
  }

  deleteStuent(int id) async {
    database.delete("students", where: "id=$id");
  }

  updateStudent(Student newStudent) async {
    log(newStudent.toMap().toString());
       log(newStudent.id.toString());
    database.update("students", newStudent.toMap(),
        where: "id=?", whereArgs: [newStudent.id]);
  }
}
