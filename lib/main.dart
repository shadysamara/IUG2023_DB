import 'package:flutter/material.dart';
import 'package:iug_local_storage/db_helper.dart';
import 'package:iug_local_storage/pages/splach_screen.dart';
import 'package:iug_local_storage/sphelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSp();
  await DbHelper.dbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplachScreen(),
    );
  }
}

class SpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SpScreenState();
  }
}

class SpScreenState extends State<SpScreen> {
  TextEditingController controller = TextEditingController();
  String nameValue = "no value set yet";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SpScreen"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nameValue,
              style: TextStyle(fontSize: 30),
            ),
            TextField(controller: controller),
            ElevatedButton(
                onPressed: () {
                  String name = controller.text;
                  SpHelper.spHelper.saveName(name);
                },
                child: Text("Test Save Name")),
            ElevatedButton(
                onPressed: () {
                  String? name = SpHelper.spHelper.getName();
                  if (name != null) {
                    nameValue = name;
                    setState(() {});
                  }
                },
                child: Text("Test get Name")),
            ElevatedButton(
                onPressed: () {
                  String name = controller.text;
                  SpHelper.spHelper.updateName(name);
                },
                child: Text("Test update Name")),
            ElevatedButton(
                onPressed: () {
                  SpHelper.spHelper.deleteName();
                },
                child: Text("Test remove Name")),
          ],
        ),
      ),
    );
  }
}
