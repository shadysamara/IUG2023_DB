import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';

class StudentsScreen extends StatefulWidget {
  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  List<Student>? allstudents;
  @override
  void initState() {
    super.initState();
    getStudentsFromDb();
  }

  getStudentsFromDb() async {
    await Future.delayed(Duration(seconds: 3));
    allstudents = await DbHelper.dbHelper.getAllStudent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Students Screen"),
      ),
      body: allstudents == null
          ? SizedBox()
          : ListView.builder(
              itemCount: allstudents!.length,
              itemBuilder: (context, index) {
                return StudentWidget(allstudents![index]);
              }),
    );
  }
}

class StudentWidget extends StatelessWidget {
  Student student;
  StudentWidget(this.student);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(student.name!),
      subtitle: Text(student.gpa!.toString()),
    );
  }
}
