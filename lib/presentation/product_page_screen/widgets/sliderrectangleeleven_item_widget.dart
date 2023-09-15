import '../models/sliderrectangleeleven_item_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderrectangleelevenItemWidget extends StatelessWidget {
  SliderrectangleelevenItemWidget(this.sliderrectangleelevenItemModelObj);

  SliderrectangleelevenItemModel sliderrectangleelevenItemModelObj;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgRectangle11,
      height: getVerticalSize(
        289,
      ),
      width: getHorizontalSize(
        390,
      ),
    );
  }
}
