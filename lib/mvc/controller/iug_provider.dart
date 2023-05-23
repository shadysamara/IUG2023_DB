// import 'package:flutter/material.dart';
// import 'package:iug_local_storage/mvc/models/db_helper.dart';
// import 'package:iug_local_storage/mvc/models/student.dart';
// import 'package:iug_local_storage/mvc/views/new_student.dart';

// class IugProvider extends ChangeNotifier {
//   IugProvider() {
//     getAllStudentFromDb();
//   }
//   int index = 0;
//   changeIndex(int newIndex) {
//     index = newIndex;
//     notifyListeners();
//   }

//   TextEditingController nameController = TextEditingController();
//   TextEditingController gpaController = TextEditingController();
//   bool isMale = true;
//   changeIsMale() {
//     isMale = !isMale;
//     notifyListeners();
//   }

//   List<Student>? allStudents;
//   getAllStudentFromDb() async {
//     allStudents = await DbHelper.dbHelper.getAllStudent();
//     notifyListeners();
//   }

//   insertStudentToDatabase() async {
//     Student student = Student(
//         name: nameController.text,
//         gpa: double.parse(gpaController.text),
//         isMale: isMale);
//     int id = await DbHelper.dbHelper.insertNewStudent(student);
//     student.id = id;
//     allStudents!.add(student);
//     cleanVariables();
//     notifyListeners();
//   }

//   deleteUserFromDb(int id) async {
//     await DbHelper.dbHelper.deleteStuent(id);
//     allStudents!.removeWhere((element) => element.id == id);
//     notifyListeners();
//   }

//   cleanVariables() {
//     nameController.clear();
//     gpaController.clear();
//     isMale = true;
//   }

//   late Student selectedStudent;
//   navigateToUpdateScreen(Student student, BuildContext context) {
//     selectedStudent = student;
//     nameController.text = student.name ?? '';
//     gpaController.text = student.gpa.toString();
//     isMale = student.isMale;
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//       return NewStudent(false);
//     }));
//   }

//   updateStudent() async {
//     Student student = Student(
//         id: selectedStudent.id,
//         name: nameController.text,
//         gpa: double.parse(gpaController.text),
//         isMale: isMale);
//     await DbHelper.dbHelper.updateStudent(student);
//     getAllStudentFromDb();
//   }
// }
