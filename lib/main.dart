import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/controller/db_provider.dart';
import 'package:iug_local_storage/mvc/controller/iug_provider.dart';
import 'package:iug_local_storage/mvc/models/api_helper.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/student.dart';
import 'package:iug_local_storage/mvc/views/provider_test.dart';
import 'package:iug_local_storage/mvc/views/students_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiHelper.apiHelper.initApi();
  await DbHelper.dbHelper.initDb();
  runApp(ChangeNotifierProvider<DbProvider>(
    create: (context)=>DbProvider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    // TODO: implement build
    return MaterialApp(
       
        home: StudentsScreen());
  }
}

class SpTestScreen extends StatefulWidget {
  @override
  State<SpTestScreen> createState() => _SpTestScreenState();
}

class _SpTestScreenState extends State<SpTestScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController gpaController = TextEditingController();

  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Test Sharedprefrences")),
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
                onPressed: () {
                  Student student = Student(
                      name: nameController.text,
                      gpa: double.parse(gpaController.text),
                      isMale: isMale);
                  DbHelper.dbHelper.insertNewStudent(student);
                },
                child: Text("Insert New Student")),
          ],
        ),
      ),
    );
  }
}
