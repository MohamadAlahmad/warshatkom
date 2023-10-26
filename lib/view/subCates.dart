import 'package:flutter/material.dart';
import 'package:warshatkom/classes/subCategory_view.dart';
import 'package:warshatkom/globals.dart';
import 'package:warshatkom/model/SubCategory.dart';
import 'package:warshatkom/networking/connection_controller.dart';
import 'package:warshatkom/view/temp/add_order.dart';
import 'package:warshatkom/widgets/app_bar.dart';

class SubCatesScreen extends StatefulWidget {
  final String title;
  final int nodeId;
  const SubCatesScreen({required this.title, required this.nodeId, super.key});

  @override
  State<SubCatesScreen> createState() => _SubCatesScreenState();
}

class _SubCatesScreenState extends State<SubCatesScreen> with TickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> mainScreenAnimation;
  late AnimationController mainScreenAnimationController;

  late List<SubCateClass> subServicesList;
  int countOfChildren = 2;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    mainScreenAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        //TODO: !!! WARNING !!! countOfChildren must not 2 , must equal to snapshot.data!.length
        //TODO: REMEMBER to remove countOfChildren
        curve: Interval((1 / countOfChildren) * 3, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    mainScreenAnimationController = animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
    getData();
  }

  Future<List<SubCategory>> getData() async {
    return await ConnectionController.getSubCategoriesById(nodeId: widget.nodeId);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: wsAppBar(context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(
              top: 25.0,
              left: 25.0,
              right: 25.0,
              bottom: 40.0,
            ),
            color: const Color(0xffffeeef),
            child: FutureBuilder<List<SubCategory>>(
                future: getData(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    subServicesList = List.generate(snapshot.data!.length, (index) {
                      return SubCateClass(
                        imgObj: imageList[index],
                        navigateScreen: snapshot.data![index].isLeave == 1 ?
                        AddOrderPage(orderId: snapshot.data![index].id, orderName: snapshot.data![index].name,) :
                        SubCatesScreen(
                          title: snapshot.data![index].name,
                          nodeId: snapshot.data![index].id,
                        ),
                        title: snapshot.data![index].name,
                      );
                    });
                    return Transform(
                      transform: Matrix4.translationValues(0.0, 30 * (1.0 - mainScreenAnimation.value), 0.0),
                      child: GridView.count(
                        childAspectRatio: snapshot.data!.length > 3 ? 1.2 : 2.0,
                        crossAxisCount: snapshot.data!.length > 3 ? 2 : 1,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 25,
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
                          return SubCateView(
                            topPadding: snapshot.data!.length < 4
                                ? MediaQuery.of(context).size.height * 0.16 //110.0
                                : 70.0,
                            width: snapshot.data!.length < 4
                                ? MediaQuery.of(context).size.width * 0.6
                                : MediaQuery.of(context).size.width * 0.4,
                            //asset: claddingList[index].asset,
                            //fit: claddingList[index].fit,
                            title: subServicesList[index].title,
                            onClick: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => subServicesList[index].navigateScreen));
                              //Get.to(() => claddingList[index].navigateScreen);
                            },
                            animation: animation,
                            animationController: animationController,
                            listData: subServicesList[index],
                            imgObj: subServicesList[index].imgObj,

                          );
                        },
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
            ),
          ),
        ),
      ),
    );
  }
}
