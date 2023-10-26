import 'package:flutter/material.dart';
import 'package:warshatkom/main.dart';

class UserData {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static String FcmToken = '';

  static _saveData(Map<String, String> data) async {
    prefs.setString(data.keys.first, data.values.first);
  }

  static Future<String> _getData(String key) async {
    return prefs.getString(key) ?? '';
  }

//RESET DATA WHEN LOGOUT
  static clearData() async {
    prefs.clear();
    saveData(fcmToken: FcmToken);
  }

  static saveData({String? fcmToken}) {
    if (fcmToken != null) {
      _saveData({'fcmToken': fcmToken});
      FcmToken = fcmToken;
    }

  }
  static getData() async {
    FcmToken = await _getData('fcmToken');
  }
}
