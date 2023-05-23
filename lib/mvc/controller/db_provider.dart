import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';
import 'package:iug_local_storage/mvc/views/new_student.dart';

class DbProvider extends ChangeNotifier {
  DbProvider() {
    getAllStudentsFromDb();
  }

  List<Student>? allStudents;
  bool isMale = true;
  int id = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController gpaController = TextEditingController();
  changeGender() {
    isMale = !isMale;
    notifyListeners();
  }

  getAllStudentsFromDb() async {
    allStudents = await DbHelper.dbHelper.getAllStudent();
    notifyListeners();
  }

  GlobalKey<FormState> formKey = GlobalKey();
  insertNewStudent() async {
// validation
  bool result =   formKey.currentState!.validate();
  if(result){
     Student student = Student(
          name: nameController.text,
          gpa: double.parse(gpaController.text),
          isMale: isMale);
      int newId = await DbHelper.dbHelper.insertNewStudent(student);
      student.id = newId;
      allStudents!.add(student);
      notifyListeners();
  }
   
  }

  deleteStudentFromDb(int id) async {
    await DbHelper.dbHelper.deleteStuent(id);
    allStudents!.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  navigateToEditScreen(Student student, BuildContext context) {
    nameController.text = student.name ?? '';
    gpaController.text = student.gpa.toString();
    isMale = student.isMale;
    id = student.id!;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NewStudent(false);
    }));
  }

  updateStudent() async {
    Student student = Student(
        id: id,
        name: nameController.text,
        gpa: double.parse(gpaController.text),
        isMale: isMale);
    await DbHelper.dbHelper.updateStudent(student);
    getAllStudentsFromDb();
  }

  convertListToString() {
    List<String> names = ["omar", "ahmed", "ali"];
    dynamic result = jsonEncode(names);
    dynamic result2 = jsonDecode(result);
    print(result2);
    print(result2.runtimeType);
  }
}
