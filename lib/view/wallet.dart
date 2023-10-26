import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warshatkom/view/home.dart';
import 'package:warshatkom/view/notifications.dart';
import 'package:warshatkom/view/orders.dart';
import 'package:warshatkom/view/settings.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('المحفظة'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset('assets/images/no-orders.png', scale: 2.0,),
            ),
            const SizedBox(height: 25.0,),
            const Text('سلة الطلبات فارغة', style: TextStyle(color: Color(0xff025464)),),
          ],
        ),
      ),

      bottomNavigationBar: GNav(
        onTabChange: (index) {
          if(index == 1) Get.to(() => const NotificationsScreen());
          if(index == 2) Get.to(() => const Home());
          if(index == 3) Get.to(() => const OrdersScreen());
          if(index == 4) Get.to(() => const SettingsScreen());
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
