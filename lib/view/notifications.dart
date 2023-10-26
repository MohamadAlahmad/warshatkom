import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warshatkom/themes/theme.dart';
import 'package:warshatkom/view/home.dart';
import 'package:warshatkom/view/orders.dart';
import 'package:warshatkom/view/settings.dart';
import 'package:warshatkom/view/wallet.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('الإشعارات'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/no-notifications.png', scale: 2.5,),
            const SizedBox(height: 25.0,),
            const Text('لا توجد أي إشعارات', style: TextStyle(color: WSThemes.primaryColor),),
          ],
        ),
      ),
      /*bottomNavigationBar: wsBottomNavigationBar(
        currentIndex: currentIndex,
        indexes: [0, 2, 3, 4],
        pages: [const WalletScreen(), const Home(), const OrdersScreen(), const SettingsScreen()],
      ),*/
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          /// TODO : ناقص واحد , والذي هو الصفحة الحالية Bottom sheet هنا , بعدد تابات الصفحات في الـ
          if(index == 0) Get.to(() => const WalletScreen());
          if(index == 2) Get.to(() => const Home());
          if(index == 3) Get.to(() => const OrdersScreen());
          if(index == 4) Get.to(() => const SettingsScreen());
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
      ),
    );
  }
}
