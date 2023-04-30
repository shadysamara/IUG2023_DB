import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  late SharedPreferences sp;
  initSp() async {
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

  bool getFirstTime() {
    bool x = sp.getBool("isFirstTime") ?? true;
    sp.setBool("isFirstTime", false);
    return x;
  }

  setFirstTime() {
    sp.setBool("isFirstTime", false);
  }
}
