import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/controller/db_provider.dart';
import 'package:iug_local_storage/mvc/controller/iug_provider.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';
import 'package:iug_local_storage/mvc/views/new_student.dart';
import 'package:provider/provider.dart';

class StudentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<DbProvider>(builder: (context, pr, x) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () async {
            // pr.convertListToString();
            dynamic x = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return NewStudent();
            }));
            
          }),
          appBar: AppBar(
            title: Text("New Students Screen"),
          ),
          body: pr.allStudents == null
              ? SizedBox()
              : ListView.builder(
                  itemCount: pr.allStudents!.length,
                  itemBuilder: (context, index) {
                    return StudentWidget(pr.allStudents![index]);
                  }));
    });
  }
}

class StudentWidget extends StatelessWidget {
  Student student;
  StudentWidget(this.student);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
          onPressed: () {
            Provider.of<DbProvider>(context, listen: false)
                .navigateToEditScreen(student, context);
          },
          icon: Icon(Icons.edit)),
      trailing: IconButton(
          onPressed: () {
            Provider.of<DbProvider>(context, listen: false)
                .deleteStudentFromDb(student.id!);
          },
          icon: Icon(Icons.delete)),
      title: Text(student.name!),
      subtitle: Text(student.gpa!.toString()),
    );
  }
}
