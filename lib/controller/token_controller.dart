// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class TokenController extends GetxController {
//   String fcmToken = '';
//   SharedPreferences? prefs;
//
//   saveToken(String value) async {
//     prefs = await SharedPreferences.getInstance();
//     fcmToken = value;
//     prefs!.setString('fcmToken', value);
//     update();
//   }
//
//   getToken(String key) async {
//     prefs = await SharedPreferences.getInstance();
//     return prefs!.getString(key);
//   }
// }