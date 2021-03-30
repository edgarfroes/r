# r

A responsiveness helper that will make your life easier.

# Usage

```
import 'package:r/r.dart';

...

  @override
  Widget build(BuildContext context) {
    // Call R's constructor at the start of your build, passing
    // the current context.
    R(context);

    // Then call R.foo wherever you need to.
    final screenWidth = R.screenWidth;
    final screenHeight = R.screenHeight;
    final safeAreaLeft = R.safeAreaLeft;
    final safeAreaRight = R.safeAreaRight;
    final safeAreaHorizontal = R.safeAreaHorizontal;
    final safeAreaTop = R.safeAreaTop;
    final safeAreaBottom = R.safeAreaBottom;
    final safeAreaVertical = R.safeAreaVertical;

    ...
  }
```