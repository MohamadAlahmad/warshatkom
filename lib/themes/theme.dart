import 'package:flutter/material.dart';

//الفاتح
//Color(0xffe8aa41),

//الغامق
//Color(0xff025464),



class WSThemes {

  static const Color primaryColor = Color(0xff025464);
  static const Color secondaryColor = Color(0xffe8aa41);

  static TextStyle titleStyle(BuildContext context) {
    return const TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      //color: Theme.of(context).primaryColor,
    );
  }
  static TextStyle subtitleStyle(BuildContext context) {
    return const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      //color: Theme.of(context).primaryColor,
    );
  }
  static TextStyle bodyTextStyle(BuildContext context) {
    return const TextStyle(
      fontSize: 16.0,
    );
  }

}
