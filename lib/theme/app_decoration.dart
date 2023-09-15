import 'package:flutter/material.dart';
import 'package:dilkara/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get stroke => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get white => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: ColorConstant.blue50,
      );
  static BoxDecoration get outlineBluegray10075 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.blueGray10075,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get primary => BoxDecoration(
        color: ColorConstant.gray90001,
      );
  static BoxDecoration get outlineBluegray10063 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.blueGray10063,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: ColorConstant.black900,
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: ColorConstant.gray200,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: ColorConstant.gray5001,
      );
  static BoxDecoration get fillGray5002 => BoxDecoration(
        color: ColorConstant.gray5002,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12,
    ),
  );

  static BorderRadius roundedBorder4 = BorderRadius.circular(
    getHorizontalSize(
      4,
    ),
  );

  static BorderRadius circleBorder50 = BorderRadius.circular(
    getHorizontalSize(
      50,
    ),
  );

  static BorderRadius customBorderTL200 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        200,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        200,
      ),
    ),
  );

  static BorderRadius circleBorder28 = BorderRadius.circular(
    getHorizontalSize(
      28,
    ),
  );

  static BorderRadius customBorderTL279 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        279,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        279,
      ),
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
