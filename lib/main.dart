import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/controllers/db_controller.dart';
import 'package:iug_local_storage/mvc/models/db_helper.dart';
import 'package:iug_local_storage/mvc/models/sphelper.dart';
import 'package:iug_local_storage/mvc/views/db_screen.dart';
import 'package:iug_local_storage/mvc/views/students_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.initSp();
  await DbHelper.dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  changeIsDarkMode() {
    isDark = !isDark;
    SpHelper.saveIsDark(isDark);
    setState(() {});
  }

  getDarkMode() {
    isDark = SpHelper.getIsDark();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DbController>(
      create: (context)=>DbController(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: isDark ? ThemeData.dark() : ThemeData.light(),
          home: StudentsScreen()
          /*Scaffold(
          appBar: AppBar(
            actions: [
              Switch(
                  value: isDark,
                  onChanged: (v) {
                    changeIsDarkMode();
                  })
            ],
          ),
        ),*/
          ),
    );
  }
}

class SpTestScreen extends StatelessWidget {
  SpTestScreen() {
    print("");
  }
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();

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
              controller: keyController,
              decoration: InputDecoration(
                  labelText: "Enter the key",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                  labelText: "Enter the value",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  String key = keyController.text;
                  String value = valueController.text;
                  SpHelper.createNewItem(key, value);
                },
                child: Text("Enter Item in SharePrefrnces")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  String key = keyController.text;
                  String? result = SpHelper.getItem(key);
                  if (result == null) {
                    log("not found");
                  } else {
                    log(result);
                  }
                },
                child: Text("print the key value")),
            ElevatedButton(onPressed: () {}, child: Text("delete the key"))
          ],
        ),
      ),
    );
  }
}
