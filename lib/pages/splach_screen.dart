import 'package:flutter/material.dart';
import 'package:iug_local_storage/pages/new_user_screen.dart';
import 'package:iug_local_storage/pages/old_user_screen.dart';
import 'package:iug_local_storage/sphelper.dart';

class SplachScreen extends StatelessWidget {
  NavigationFunction(BuildContext context) async{
    await Future.delayed(Duration(seconds: 2));
    bool isFirstTime = SpHelper.spHelper.getFirstTime();
    if (isFirstTime) {
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
    NavigationFunction(context);
    return Scaffold(
      body: Center(
        child: Text(
          "Splach Screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
