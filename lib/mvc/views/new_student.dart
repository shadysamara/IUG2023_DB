import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/controller/db_provider.dart';
import 'package:iug_local_storage/mvc/controller/iug_provider.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';
import 'package:provider/provider.dart';

class NewStudent extends StatelessWidget {
  bool isNewStudent;
  NewStudent([this.isNewStudent = true]);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DbProvider>(builder: (context, pr, x) {
      return Scaffold(
        appBar: AppBar(
            title:
                Text(isNewStudent ? "New Student Screen" : "Update Student")),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: pr.formKey,
            child: Column(
              children: [
                TextFormField(                 
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required field";
                    } else if (value.length < 3) {
                      return "the name must be larger than or equal 3 letters";
                    }
                  },
                  controller: pr.nameController,
                  decoration: InputDecoration(
                    
                      labelText: "Enter the Student name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required field";
                    }else if (double.parse(value) > 100 ||
                        double.parse(value) < 0) {
                      return "gpa must be between 0 and 100";
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: pr.gpaController,
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
                        groupValue: pr.isMale,
                        onChanged: (v) {
                          pr.changeGender();
                        }),
                    Text("Male"),
                    SizedBox(
                      width: 20,
                    ),
                    Radio(
                        value: false,
                        groupValue: pr.isMale,
                        onChanged: (v) {
                          pr.changeGender();
                        }),
                    Text("FeMale"),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (isNewStudent) {
                        pr.insertNewStudent();
                      } else {
                        pr.updateStudent();
                      }
                    },
                    child: Text(isNewStudent
                        ? "Insert New Student"
                        : "Update Student")),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).pop("hello");
                    },
                    child: Text("back to previous page")),
              ],
            ),
          ),
        ),
      );
    });
  }
}
