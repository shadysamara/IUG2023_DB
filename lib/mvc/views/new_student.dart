// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:iug_local_storage/custom_textfield.dart';
// import 'package:iug_local_storage/mvc/models/db_helper.dart';
// import 'package:iug_local_storage/mvc/models/student.dart';

// class NewStudentScreen extends StatelessWidget {
 
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(title: Text("New Student Screen")),
//         body: Container(
//           margin: EdgeInsets.all(15),
//           child: Column(
//             children: [
//               CustomTextfield("Student Name", nameController),
//               CustomTextfield("Student Gpa", gpaController),
//               Row(
//                 children: [
//                   Text("Gender: "),
//                   Radio(
//                       value: true,
//                       groupValue: isMale,
//                       onChanged: (v) {
//                         isMale = true;
//                         setState(() {});
//                       }),
//                   Text("Male"),
//                   SizedBox(
//                     width: 50,
//                   ),
//                   Radio(
//                       value: false,
//                       groupValue: isMale,
//                       onChanged: (v) {
//                         isMale = false;
//                         setState(() {});
//                       }),
//                   Text("FeMale"),
//                 ],
//               ),
//               ElevatedButton(
//                   onPressed: ()async {
//                     Student student = Student(
//                         name: nameController.text,
//                         isMale: isMale,
//                         gpa: double.parse(gpaController.text));
//                    await DbHelper.dbHelper.insertNewStudent(student);
//                     widget.function();
//                   },
//                   child: const Text("Insert New Student")),
//             ],
//           ),
//         ));
//   }
// }
