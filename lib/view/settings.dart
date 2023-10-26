import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warshatkom/view/home.dart';
import 'package:warshatkom/view/notifications.dart';
import 'package:warshatkom/view/orders.dart';
import 'package:warshatkom/view/wallet.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('الإعدادات'),
        centerTitle: true,
      ),
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          if(index == 0) Get.to(() => const WalletScreen());
          if(index == 1) Get.to(() => const NotificationsScreen());
          if(index == 2) Get.to(() => const Home());
          if(index == 3) Get.to(() => const OrdersScreen());
        },
        tabMargin: const EdgeInsets.only(top: 10.0, bottom: 10.0
        ),
        padding: const EdgeInsets.all(10.0),
        tabBorderRadius: 30.0,
        //rippleColor: const Color(0xffe8aa41),
        selectedIndex: currentIndex,
        backgroundColor: const Color(0xff025464),
        gap: 5.0,
        tabs: [
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/chart.png', scale: 16.0,),
            text: 'المحفظة',
            backgroundColor: const Color(0xffe8aa41),
          ),
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/bell.png', scale: 16.0,),
            text: 'الإشعارات',
            backgroundColor: const Color(0xffe8aa41),
          ),
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/house.png', scale: 16.0,),
            text: 'الرئيسية',
            backgroundColor: const Color(0xffe8aa41),
          ),
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/check-list.png', scale: 16.0,),
            text: 'الطلبات',
            backgroundColor: const Color(0xffe8aa41),
          ),
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/management.png', scale: 16.0,),
            text: 'الإعدادات',
            backgroundColor: const Color(0xffe8aa41),
          ),
        ],
      ),
    );
  }
}
