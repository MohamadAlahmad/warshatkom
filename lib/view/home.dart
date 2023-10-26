import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:warshatkom/classes/mainCategory_view.dart';
import 'package:warshatkom/globals.dart';
import 'package:warshatkom/model/MainCategory.dart';
import 'package:warshatkom/networking/connection_controller.dart';
import 'package:warshatkom/themes/theme.dart';
import 'package:warshatkom/view/notifications.dart';
import 'package:warshatkom/view/orders.dart';
import 'package:warshatkom/view/settings.dart';
import 'package:warshatkom/view/temp/dynamic_page.dart';
import 'package:warshatkom/view/wallet.dart';
import 'package:warshatkom/widgets/app_bar.dart';
import 'package:warshatkom/widgets/warsha_card.dart';
// Color(0xffe8aa41), الفاتح
// Color(0xff025464), الغامق
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  late AnimationController animationController;
  late List<MainCateClass> serviceList;
  int currentIndex = 2;

  Future<List<MainCategory>> getData() async {
    return await ConnectionController.getCategories();
  }

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
    getData();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 0.0, left: 25.0, right: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ورشة جديدة', style: WSThemes.titleStyle(context),),
                const SizedBox(height: 25.0,),

                Expanded(
                  flex: 3,
                  child: FutureBuilder<List<MainCategory>>(
                    future: getData(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        serviceList = List.generate(snapshot.data!.length, (index) {
                          return MainCateClass(
                            navigateScreen: DynamicPage(
                              title: snapshot.data![index].name,
                              nodeId: snapshot.data![index].id,
                            ),
                            widget: iconList[index],
                            title: snapshot.data![index].name,
                          );
                        });
                        return GridView.count(
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 1,
                          physics: const BouncingScrollPhysics(),
                          childAspectRatio: 0.6,
                          //crossAxisSpacing: 25,
                          mainAxisSpacing: 10,
                          children: List.generate(snapshot.data!.length, (index) {
                            final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: animationController,
                                curve: Interval(
                                  (1 / snapshot.data!.length) * index,
                                  1.0,
                                  curve: Curves.easeOutSine,
                                ),
                              ),
                            );
                            animationController.forward();
                            return MainCateView(
                              topPadding: MediaQuery.of(context).size.height * 0.12, //75.0
                              width: MediaQuery.of(context).size.width * 0.3,
                              widget: serviceList[index].widget,
                              title: serviceList[index].title,
                              onClick: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => serviceList[index].navigateScreen));
                              },
                              animation: animation,
                              animationController: animationController,
                              listData: serviceList[index],
                            );
                          }),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 25.0,),
                Text('الورشات القائمة', style: WSThemes.titleStyle(context),),
                Container(
                  height: 10.0,
                  color: WSThemes.secondaryColor.withOpacity(0.2),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: WSThemes.secondaryColor.withOpacity(0.2),
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return warshaCard();
                      },
                    ),
                  ),
                ),
                Container(
                  height: 10.0,
                  color: WSThemes.secondaryColor.withOpacity(0.2),
                ),
                Container(
                  height: 25.0,
                ),
                Text('يكثر طلبها', style: WSThemes.titleStyle(context),),
                Container(
                  height: 10.0,
                  color: WSThemes.secondaryColor.withOpacity(0.2),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: WSThemes.secondaryColor.withOpacity(0.2),
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return warshaCard();
                      },
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: GNav(
        onTabChange: (index) {
          if(index == 0) Get.to(() => const WalletScreen());
          if(index == 1) Get.to(() => const NotificationsScreen());
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
          /*GButton(
            icon: Icons.add,
            leading: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Colors.amber, Colors.amber],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              child: Image.asset(
                'assets/icons/bell2.png', scale: 16.0,
              ),
            ),
            text: 'الإشعارات',
            backgroundColor: const Color(0xffe8aa41),
          ),*/
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/chart.png', scale: 16.0,),
            text: 'المحفظة',
            backgroundColor: WSThemes.secondaryColor.withOpacity(0.9),
          ),
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/bell.png', scale: 16.0,),
            text: 'الإشعارات',
            backgroundColor: WSThemes.secondaryColor
          ),
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/house.png', scale: 16.0,),
            text: 'الرئيسية',
            backgroundColor: WSThemes.secondaryColor
          ),
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/check-list.png', scale: 16.0,),
            text: 'الطلبات',
            backgroundColor: WSThemes.secondaryColor
          ),
          GButton(
            icon: Icons.add,
            leading: Image.asset('assets/icons/management.png', scale: 16.0,),
            text: 'الإعدادات',
            backgroundColor: WSThemes.secondaryColor
          ),
        ],
      ),

      appBar: wsAppBar(context),

      /*endDrawer: Drawer(
        backgroundColor: const Color(0xffe8aa41),
        width: Get.width * 0.667,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              const DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/logo/watermark.PNG',),
                      radius: 40.0,
                    ),
                    Text('الاسم'),
                    Text('رقم الموبايل'),
                  ],
                ),
              ),
              ListTile(
                title: const Text('تسجيل الدخول'),
                leading: const Icon(Icons.login),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => const LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),*/

    );
  }
}


