import 'package:flutter/material.dart';
import 'package:iug_local_storage/dbhelper.dart';
import 'package:iug_local_storage/pages/splach.dart';
import 'package:iug_local_storage/sphelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.initSp();
  await DbHelper.initDb();
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
