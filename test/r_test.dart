import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:r/r.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Test R measurements", (tester) async {
    final double leftPadding = 10;
    final double topPadding = 20;
    final double rightPadding = 30;
    final double bottomPadding = 40;

    final Size screenSize = Size(200, 400);

    final binding = tester.binding;

    binding.window.physicalSizeTestValue = screenSize;

    binding.window.devicePixelRatioTestValue = 1.0;

    binding.window.paddingTestValue = WindowPaddingImplementation(
      bottom: bottomPadding,
      left: leftPadding,
      right: rightPadding,
      top: topPadding,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            R(context);

            expect(R.screenWidth, screenSize.width,
                reason:
                    'R\'s screenWidth property must match actual screen\'s width');

            expect(R.screenHeight, screenSize.height,
                reason:
                    'R\'s screenHeight property must match actual screen\'s height');

            expect(R.safeAreaLeft, leftPadding,
                reason:
                    'R\'s safeAreaLeft property must match actual screen\'s left padding (safe area)');

            expect(R.safeAreaTop, topPadding,
                reason:
                    'R\'s safeAreaTop property must match actual screen\'s top padding (safe area)');

            expect(R.safeAreaRight, rightPadding,
                reason:
                    'R\'s safeAreaRight property must match actual screen\'s right padding (safe area)');

            expect(R.safeAreaBottom, bottomPadding,
                reason:
                    'R\'s safeAreaBottom property must match actual screen\'s bottom padding (safe area)');

            expect(R.safeAreaHorizontal, leftPadding + rightPadding,
                reason:
                    'R\'s safeAreaHorizontal property must match actual screen\'s horizontal padding (safe area)');

            expect(R.safeAreaVertical, topPadding + bottomPadding,
                reason:
                    'R\'s safeAreaVertical property must match actual screen\'s vertical padding (safe area)');

            // The builder function must return a widget.
            return Placeholder();
          },
        ),
      ),
    );

    // resets the screen to its orinal size after the test end
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    addTearDown(tester.binding.window.clearPaddingTestValue);
  });
}

class WindowPaddingImplementation implements WindowPadding {
  late final double _bottom;
  late final double _left;
  late final double _right;
  late final double _top;

  WindowPaddingImplementation({
    required double bottom,
    required double left,
    required double right,
    required double top,
  }) {
    _bottom = bottom;
    _left = left;
    _right = right;
    _top = top;
  }

  @override
  double get bottom => _bottom;

  @override
  double get left => _left;

  @override
  double get right => _right;

  @override
  double get top => _top;
}
