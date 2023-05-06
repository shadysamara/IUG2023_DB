import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';

class DbController extends ChangeNotifier {
  DbController() {
    getAllStudents();
  }
  List<Student> students = [];
  bool isLoading = false;
  flipIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  getAllStudents() async {
    flipIsLoading();
    students = await DbHelper.dbHelper.getAllStudents();
    flipIsLoading();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController gpaController = TextEditingController();
  bool isMale = true;
  insertNewStudent() async {
    Student student = Student(
        name: nameController.text,
        isMale: isMale,
        gpa: double.parse(gpaController.text));
    await DbHelper.dbHelper.insertNewStudent(student);
    getAllStudents();
  }

  // updateStudent(int id) async {

  // }

  deleteStudent(int id) async {
    await DbHelper.dbHelper.deleteStudent(id);
    students.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
