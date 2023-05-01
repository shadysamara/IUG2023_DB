import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {

  static late SharedPreferences sp;
  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }

  saveName(String value) {
    sp.setString("name", value);
  }

  String? getName() {
    return sp.getString('name');
  }

  updateName(String newValue) {
    sp.setString("name", newValue);
  }

  deleteName() {
    sp.remove('name');
  }

  static bool getIsFirstTime() {
    bool? isFirstTime = sp.getBool("isFirstTimeVP");
    if (isFirstTime == null) {
      sp.setBool("isFirstTimeVP", false);
      return true;
    } else {
      return false;
    }
  }
}
