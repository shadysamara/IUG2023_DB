import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iug_local_storage/dbhelper.dart';

class AllStudentsScreen extends StatefulWidget {
  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {
  List<Map<String, dynamic>>? data;
  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  getAllStudents() async {
    await Future.delayed(Duration(seconds: 3));
    data = await DbHelper.getAllStudents();
    setState(() {});
  }

  deleteStudent(int id) async {
    await DbHelper.deleteStudent(id);
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("All Students Page")),
        body: data == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data![index]['name']),
                    subtitle: Text('Gpa: ${data![index]['Gpa']}'),
                    leading: IconButton(
                        onPressed: () {
                          deleteStudent(data![index]['id']);
                        },
                        icon: Icon(Icons.delete)),
                  );
                }));
  }
}
