import 'package:flutter/material.dart';
import 'package:warshatkom/themes/theme.dart';

Widget warshaCard() {
  return Card(
    child: ListTile(
      leading: Image.asset('assets/logo/watermark.PNG'),
      title: const Text('اسم الورشة', style: TextStyle(color: WSThemes.primaryColor,),),
      subtitle: const Text('التصنيف'),
      trailing: RotatedBox(
        quarterTurns: 2,
        child: Container(
          padding: const EdgeInsets.only(right: 5.0),
          height: 25.0,
          width: 25.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: WSThemes.secondaryColor.withOpacity(0.7),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 12.0,
          ),
        ),
      ),
      onTap: () {},
    ),
  );
}