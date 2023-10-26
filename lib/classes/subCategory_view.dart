import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:warshatkom/globals.dart';

class SubCateClass {
  SubCateClass({
    required this.navigateScreen,
    required this.title,
    required this.imgObj,
    //required this.onClick,
    //required this.asset,
    //required this.fit,
  });

  String title;
  Widget navigateScreen;
  ImgObj imgObj;

  //String asset;
  //BoxFit fit;
  //late VoidCallback onClick;

  /*static List<CladdingList> claddingList = [
    CladdingList(
      title: 'تصميم',
      //asset: 'assets/images/architect.jpg',
      //fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
    CladdingList(
      title: 'تنفيذ',
      //asset: 'assets/images/cladding.jpg',
      //fit: BoxFit.cover,
      navigateScreen: const DynamicTabsPage(title: 'تصميم', tabTitle1: 'جزئي', tabTitle2: 'كامل'),
      //onClick: () {},
    ),
  ];*/
}

class SubCateView extends StatelessWidget {
  const SubCateView(
      {Key? key,
        required this.listData,
        required this.animationController,
        required this.animation,
        required this.topPadding,
        required this.width,
        required this.imgObj,
        required this.title,
        required this.onClick,
        //required this.asset,
        //required this.fit,
        //required this.widget,
      })
      : super(key: key);

  final SubCateClass listData;
  final VoidCallback onClick;
  final AnimationController animationController;
  final Animation<double> animation;
  final double topPadding;
  final ImgObj imgObj;
  final double width;
  //final String asset;
  //final BoxFit fit;
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
                            image: AssetImage(imgObj.asset),
                            fit: imgObj.fit,
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
