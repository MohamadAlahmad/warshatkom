import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warshatkom/themes/theme.dart';
import 'package:warshatkom/view/login.dart';

PreferredSize wsAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    ),
    child: Container(
      padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logo/slogan2.png', scale: 5.0,),
          Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    showUserOptions(context);
                  },
                  icon: const Icon(CupertinoIcons.person_crop_circle_fill, size: 40.0, color: WSThemes.primaryColor,),
                );
              }
          ),
        ],
      ),
    ),
  );
}

showUserOptions(BuildContext context) {
  showMenu(
    context: context,
    color: WSThemes.secondaryColor,
    position: RelativeRect.fromLTRB(40.0, MediaQuery.of(context).size.height * 0.12, 0.0, 100) ,
    items: [
      PopupMenuItem(
        child: const Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Text('تسجيل الدخول', style: TextStyle(color: WSThemes.primaryColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            ],
          ),
        ),
        onTap: () {
          Get.to(() => const LoginScreen());
        },
      ),
      PopupMenuItem(
        child: const Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Text('إضافة صورة', style: TextStyle(color: WSThemes.primaryColor, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        onTap: () {},
      )
    ],
  );
}