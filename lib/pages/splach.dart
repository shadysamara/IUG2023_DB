import 'package:flutter/material.dart';
import 'package:iug_local_storage/mvc/models/sphelper.dart';
import 'package:iug_local_storage/pages/new_user.dart';
import 'package:iug_local_storage/pages/old_user.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  navigationFun(BuildContext context) {
  
    bool result = SpHelper.checkFirstTime();
    if (result) {
      // navigate to new user
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return NewUserScreen();
      }));
    } else {
      //navigate to old user
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return OldUserScreen();
      }));
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     navigationFun(context);
  }
  @override
  Widget build(BuildContext context) {
   
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
