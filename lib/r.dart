library r;

import 'package:flutter/widgets.dart';

class R {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double safeAreaLeft;
  static late double safeAreaRight;
  static late double safeAreaHorizontal;
  static late double safeAreaTop;
  static late double safeAreaBottom;
  static late double safeAreaVertical;

  R(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    safeAreaLeft = _mediaQueryData.padding.left;
    safeAreaRight = _mediaQueryData.padding.right;
    safeAreaHorizontal = safeAreaLeft + safeAreaRight;
    safeAreaTop = _mediaQueryData.padding.top;
    safeAreaBottom = _mediaQueryData.padding.bottom;
    safeAreaVertical = safeAreaTop + safeAreaBottom;
  }
}
