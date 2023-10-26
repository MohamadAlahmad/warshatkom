import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class MaintenanceList {
  MaintenanceList({
    required this.navigateScreen,
    //required this.onClick,
    required this.title,
    required this.asset,
    required this.fit,
  });

  String title;
  Widget navigateScreen;
  String asset;
  BoxFit fit;
  //late VoidCallback onClick;

  /*static List<MaintenanceList> maintenanceList = [
    MaintenanceList(
      title: 'كهرباء',
      asset: 'assets/temp/electricity.jpg',
      fit: BoxFit.cover,
      navigateScreen: DynamicPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'صحية',
      asset: 'assets/temp/sanitary.png',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'دهان',
      asset: 'assets/temp/paint.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'أعمال خشبية و أبواب',
      asset: 'assets/temp/wood.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'ورق جدران',
      asset: 'assets/temp/wall_paper.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'أرضيات بلاط',
      asset: 'assets/temp/floor.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'ديكورات جِبس',
      asset: 'assets/temp/gypsum_board.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'حدادة',
      asset: 'assets/temp/blacksmith.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'ألمنيوم',
      asset: 'assets/temp/aluminium.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'مكيفات',
      asset: 'assets/temp/condition.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'انترنيت',
      asset: 'assets/temp/internet.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'تركيب ديجيتال',
      asset: 'assets/temp/dish.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'هد و ترحيل',
      asset: 'assets/temp/tractor.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'تنظيف و تعزيل',
      asset: 'assets/temp/clean.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'نقل عفش عام',
      asset: 'assets/temp/move.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'غسيل وصيانة ألواح شمسية',
      asset: 'assets/temp/solar.jpg',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    MaintenanceList(
      title: 'أعمال أخرى',
      asset: 'assets/logo/logo.png',
      fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
  ];*/
}

class MaintenanceListView extends StatelessWidget {
  const MaintenanceListView(
      {Key? key,
        required this.listData,
        required this.animationController,
        required this.animation,
        required this.topPadding,
        required this.width,
        required this.asset,
        required this.fit,
        required this.title,
        required this.onClick,
        //required this.widget,
      })
      : super(key: key);

  final MaintenanceList listData;
  final VoidCallback onClick;
  final AnimationController animationController;
  final Animation<double> animation;
  final double topPadding;
  final double width;
  final String asset;
  final BoxFit fit;
  final String title;
  //final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              onTap: () {
                onClick();
              },
              child: Stack(
                children: [
                  Center(
                    child: Material(
                      borderOnForeground: true,
                      elevation: 5.0,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: Container(
                        width: width,
                        padding: const EdgeInsets.all(5.0),
                        margin: const EdgeInsets.only(bottom: 40.0),/*********************/
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff025464), Color(0xff056577), Color(0xffe8aa41),],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          image: DecorationImage(
                            image: AssetImage(asset),
                            fit: fit,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: topPadding,/*********************/
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        title,
                        style: const TextStyle(fontSize: 20.0,),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 10.0,
                        maxFontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
