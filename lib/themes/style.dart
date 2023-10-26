import 'dart:ui';

class Style {
  static double SCALE = 1.0;
  static double TEXT_SCALE = 1.0;
  static double WARSHATKOM_SIZE(double size) {
    return size / SCALE;
  }

  static Radius MyRadius(double _raddius) {
    return Radius.circular((_raddius / SCALE).ceilToDouble());
  }

}