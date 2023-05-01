import 'package:flutter/material.dart';
import 'package:iug_local_storage/pages/new_user_screen.dart';
import 'package:iug_local_storage/pages/old_user_screen.dart';
import 'package:iug_local_storage/sphelper.dart';

class SplachScreen extends StatelessWidget {
  navigationFun(BuildContext context) async{
    await Future.delayed(Duration(seconds: 3));
    bool x = SpHelper.getIsFirstTime();
    if (x) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return NewUserScreen();
      }));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return OldUserScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    navigationFun(context);
    return Scaffold(
      body: Center(
        child: Text(
          "Splach",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
