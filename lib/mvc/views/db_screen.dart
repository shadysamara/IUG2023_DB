import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';

class DbScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('DbScreen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Test Insert"),
          onPressed: () {
            DbHelper.dbHelper.getAllStudents();
          },
        ),
      ),
    );
  }
}
