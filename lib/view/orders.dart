import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warshatkom/themes/theme.dart';
import 'package:warshatkom/view/home.dart';
import 'package:warshatkom/view/notifications.dart';
import 'package:warshatkom/view/settings.dart';
import 'package:warshatkom/view/wallet.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('طلباتي'),
        centerTitle: true,
      ),
      bottomNavigationBar: GNav(
        onTabChange: (index) {
          if(index == 0) Get.to(() => const WalletScreen());
          if(index == 1) Get.to(() => const NotificationsScreen());
          if(index == 2) Get.to(() => const Home());
          if(index == 4) Get.to(() => const SettingsScreen());
        },
        tabMargin: const EdgeInsets.only(top: 10.0, bottom: 10.0
        ),
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
