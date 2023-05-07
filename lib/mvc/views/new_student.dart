import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';

class NewStudent extends StatefulWidget {
  Function fun;
  Student? student;
  NewStudent(this.fun, [this.student]);
  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  TextEditingController nameController = TextEditingController();

  TextEditingController gpaController = TextEditingController();

  bool isMale = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.student != null) {
      nameController.text = widget.student!.name ?? '';
      gpaController.text = widget.student!.gpa.toString();
      isMale = widget.student!.isMale;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.student == null
              ? "New Student Screen"
              : "Update Student Screen")),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Enter the Student name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: gpaController,
              decoration: InputDecoration(
                  labelText: "Enter the Student GPA",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Gender: "),
                Radio(
                    value: true,
                    groupValue: isMale,
                    onChanged: (v) {
                      isMale = true;
                      setState(() {});
                    }),
                Text("Male"),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    value: false,
                    groupValue: isMale,
                    onChanged: (v) {
                      isMale = false;
                      setState(() {});
                    }),
                Text("FeMale"),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  if (widget.student == null) {
                  
                    Student student = Student(
                        name: nameController.text,
                        gpa: double.parse(gpaController.text),
                        isMale: isMale);
                    await DbHelper.dbHelper.insertNewStudent(student);
                  } else {
                  
                     Student student = Student(
                      id: widget.student!.id,
                        name: nameController.text,
                        gpa: double.parse(gpaController.text),
                        isMale: isMale);
                        await DbHelper.dbHelper.updateStudent(student);
                  }

                   widget.fun();
                },
                child: Text(widget.student == null
                    ? "Insert New Student"
                    : "Update Student")),
          ],
        ),
      ),
    );
  }
}
