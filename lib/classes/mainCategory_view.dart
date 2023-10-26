import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MainCateClass {
  MainCateClass({
    required this.navigateScreen,
    required this.widget,
    //required this.onClick,
    required this.title,
  });

  String title;
  Widget navigateScreen;
  Widget widget;

  //late VoidCallback onClick;
  /*static List<ServiceList> serviceList = [
    ServiceList(
      title: 'إكساء',
      widget: Image.asset('assets/gif/home.gif', scale: 5.0, color: const Color(0xffe8aa41),),
      navigateScreen: const CladdingScreen(),
      //onClick: () {},
    ),
    ServiceList(
      title: 'عقود',
      widget: Image.asset('assets/gif/file.gif', scale: 5.0, color: const Color(0xffe8aa41),),
      navigateScreen: const ContractsScreen(),
      //onClick: () {},
    ),
    ServiceList(
      title: 'صيانة',
      widget: Image.asset('assets/gif/settings.gif', scale: 5.0, color: const Color(0xffe8aa41),),
      navigateScreen: const MaintenanceScreen(),
      //onClick: () {},
    ),
  ];*/
}

class MainCateView extends StatelessWidget {
  const MainCateView(
      {Key? key,
        required this.listData,
        required this.animationController,
        required this.animation,
        required this.topPadding,
        required this.width,
        //required this.asset,
        //required this.fit,
        required this.title,
        required this.onClick,
        required this.widget,
      })
      : super(key: key);

  final MainCateClass listData;
  final VoidCallback onClick;
  final AnimationController animationController;
  final Animation<double> animation;
  final double topPadding;
  final double width;
  //final String asset;
  //final BoxFit fit;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              onTap: () {
                onClick();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, top: 15.0, right: 10.0, bottom: 10.0),
                color: const Color(0xff025464),
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: widget,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            title,
                            style: const TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            minFontSize: 10.0,
                            maxFontSize: 24.0,
                          ),
                          const AutoSizeText(
                            'هنا النص سيتم تعبئته من الـ API',
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            minFontSize: 8.0,
                            maxFontSize: 12.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


/*serviceWidget(
                  context,
                  'إكساء',
                  Image.asset('assets/gif/home.gif', scale: 5.0, color: const Color(0xffe8aa41),), () {
                    Get.to(() => const CladdingScreen());
                  },
                ),
                serviceWidget(
                  context,
                  'عقود',
                  Image.asset('assets/gif/file.gif', scale: 5.0, color: const Color(0xffe8aa41),), () {
                    Get.to(() => const ContractsScreen());
                  },
                ),
                serviceWidget(
                  context,
                  'صيانة',
                  Image.asset('assets/gif/settings.gif', scale: 5.0, color: const Color(0xffe8aa41),), () {
                  Get.to(() => const MaintenanceScreen());
                  },
                ),
*/