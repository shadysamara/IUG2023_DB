// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:iug_local_storage/mvc/models/db_helper.dart';
// import 'package:iug_local_storage/mvc/models/student.dart';

// class NewStudent extends StatefulWidget {
//   Function function;
//   NewStudent(this.function);
//   @override
//   State<NewStudent> createState() => _NewStudentState();
// }

// class _NewStudentState extends State<NewStudent> {
//   TextEditingController nameController = TextEditingController();

//   TextEditingController gpaController = TextEditingController();

//   bool isMale = true;

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(title: Text("New Student Screen")),
//       body: Container(
//         margin: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                   labelText: "Enter the Student name",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15))),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: gpaController,
//               decoration: InputDecoration(
//                   labelText: "Enter the Student GPA",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15))),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 Text("Gender: "),
//                 Radio(
//                     value: true,
//                     groupValue: isMale,
//                     onChanged: (v) {
//                       isMale = true;
//                       setState(() {});
//                     }),
//                 Text("Male"),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Radio(
//                     value: false,
//                     groupValue: isMale,
//                     onChanged: (v) {
//                       isMale = false;
//                       setState(() {});
//                     }),
//                 Text("FeMale"),
//               ],
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   Student student = Student(
//                       name: nameController.text,
//                       gpa: double.parse(gpaController.text),
//                       isMale: isMale);
//                   await DbHelper.dbHelper.insertNewStudent(student);
//                   widget.function();
//                 },
//                 child: Text("Insert New Student")),
//           ],
//         ),
//       ),
//     );
//   }
// }
