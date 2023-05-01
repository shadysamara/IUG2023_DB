import 'package:flutter/material.dart';
import 'package:iug_local_storage/custom_textfield.dart';
import 'package:iug_local_storage/dbhelper.dart';
import 'package:iug_local_storage/student.dart';

class NewStudentScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController gpaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("New Student Screen")),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              CustomTextfield("Student Name", nameController),
              CustomTextfield("Student Gender", genderController),
              CustomTextfield("Student Gpa", gpaController),
              ElevatedButton(
                  onPressed: () {
                    Student student = Student(
                        name: nameController.text,
                        gpa: int.parse(gpaController.text),
                        gender: genderController.text);
                    DbHelper.insertNewStudent(student);
                  },
                  child: const Text("Insert New Student")),
              ElevatedButton(
                  onPressed: () {
                    DbHelper.getAllStudents();
                  },
                  child: const Text("Test Get Students"))
            ],
          ),
        ));
  }
}
