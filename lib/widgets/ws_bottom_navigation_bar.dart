import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warshatkom/themes/theme.dart';

Widget wsBottomNavigationBar({required int currentIndex, required List<int> indexes, required List<dynamic> pages}) {
  return GNav(
    onTabChange: (index) {
      /// TODO : ناقص واحد , والذي هو الصفحة الحالية Bottom sheet هنا , بعدد تابات الصفحات في الـ
      if(index == indexes[0]) Get.to(() => pages[0]);
      if(index == indexes[1]) Get.to(() => pages[1]);
      if(index == indexes[2]) Get.to(() => pages[2]);
      if(index == indexes[3]) Get.to(() => pages[3]);
    },
    tabMargin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    padding: const EdgeInsets.all(10.0),
    tabBorderRadius: 30.0,
    //rippleColor: const Color(0xffe8aa41),
    selectedIndex: currentIndex,
    backgroundColor: WSThemes.primaryColor,
    gap: 5.0,
    tabs: [
      GButton(
        icon: Icons.add,
        leading: Image.asset('assets/icons/chart.png', scale: 16.0,),
        text: 'المحفظة',
        backgroundColor: WSThemes.secondaryColor,
      ),
      GButton(
        icon: Icons.add,
        leading: Image.asset('assets/icons/bell.png', scale: 16.0,),
        text: 'الإشعارات',
        backgroundColor: WSThemes.secondaryColor,
      ),
      GButton(
        icon: Icons.add,
        leading: Image.asset('assets/icons/house.png', scale: 16.0,),
        text: 'الرئيسية',
        backgroundColor: WSThemes.secondaryColor,
      ),
      GButton(
        icon: Icons.add,
        leading: Image.asset('assets/icons/check-list.png', scale: 16.0,),
        text: 'الطلبات',
        backgroundColor: WSThemes.secondaryColor,
      ),
      GButton(
        icon: Icons.add,
        leading: Image.asset('assets/icons/management.png', scale: 16.0,),
        text: 'الإعدادات',
        backgroundColor: WSThemes.secondaryColor,
      ),
    ],
  );
}