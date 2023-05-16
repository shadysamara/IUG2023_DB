import 'package:flutter/material.dart';

class IugProvider extends ChangeNotifier {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  String result = "";
  plusFun() {
    int num1 = int.parse(firstController.text);
    int num2 = int.parse(secondController.text);
    result = (num1 + num2).toString();
    notifyListeners();
  }

  substractFunction() {
    int num1 = int.parse(firstController.text);
    int num2 = int.parse(secondController.text);
       result = (num1 - num2).toString();
    notifyListeners();
  }

  multiplyFunction() {
    int num1 = int.parse(firstController.text);
    int num2 = int.parse(secondController.text);
       result = (num1 * num2).toString();
    notifyListeners();
  }

  DevisionFunction() {
    int num1 = int.parse(firstController.text);
    int num2 = int.parse(secondController.text);
       result = (num1 / num2).toString();
    notifyListeners();
  }

  String name = "omar";
  String university = "IUG";
  String courseName = "Flutter";
  changeName(String newName) {
    name = newName;
    notifyListeners();
  }
}
