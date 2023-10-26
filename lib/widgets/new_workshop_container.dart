import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget newWorkshopContainer(
    BuildContext context,
    String title,
    String asset,
    double width,
    double topPadding,
    BoxFit fit,
    VoidCallback onClick)
{
  return InkWell(
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
  );
}

/*

class ContainerWitheImage extends StatefulWidget {
  final String title;
  final String asset;
  final BoxFit fit;
  final VoidCallback onClick;
  const ContainerWitheImage({required this.title, required this.asset, required this.fit, required this.onClick, super.key});

  @override
  State<ContainerWitheImage> createState() => _ContainerWitheImageState();
}

class _ContainerWitheImageState extends State<ContainerWitheImage>  with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // Reversing the animation for the pulsating effect
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClick();
      },
      child: Stack(
        children: [
          */
/*AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + _controller.value * 0.1,
                child: Image.asset('assets/your_image.png'),
              );
            },
          ),*//*

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
                width: 250.0,
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(bottom: 40.0),*/
/*********************//*

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff025464), Color(0xff056577), Color(0xffe8aa41),],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  */
/*image: DecorationImage(
                    image: AssetImage(widget.asset),
                    fit: widget.fit,
                  ),*//*

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 + _controller.value * 0.1,
                      child: Image.asset(widget.asset, fit: widget.fit,),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 120.0),*/
/*********************//*

            child: Center(
              child: Text(widget.title, style: const TextStyle(fontSize: 20.0,), textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}

*/
