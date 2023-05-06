import 'dart:developer';

import 'package:iug_local_storage/mvc/models/student.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  initDatabase() async {
    String appPath = await getDatabasesPath();
    String dbPath = appPath + '/flutter_course.db';
    database = await openDatabase(dbPath, version: 2, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, isMale INTEGER, gpa REAL)');
    });
  }

  insertNewStudent(Student student) async {
    try {
      int rowNumber = await database.insert('students', student.toMap());
      log(rowNumber.toString());
    } catch (e) {
      log("row has not been inserted");
    }
  }

  Future<List<Student>> getAllStudents() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Map> results = await database.query('students');
    List<Student> students = results.map((e) => Student.fromMap(e)).toList();
    return students;
  }

  Future<Student> getStudentById(int id) async {
    List<Map> results = await database.query('students', where: 'id=$id');
    return Student.fromMap(results.first);
  }

  deleteStudent(int id) async {
    await database.delete('students', where: 'id=$id');
  }

  updateStudent(Student student) async {
    await database.update('students', student.toMap(),
        where: 'id=${student.id}');
  }
}
