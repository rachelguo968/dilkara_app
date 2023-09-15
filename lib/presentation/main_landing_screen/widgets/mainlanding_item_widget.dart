import '../models/mainlanding_item_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainlandingItemWidget extends StatelessWidget {
  MainlandingItemWidget(this.mainlandingItemModelObj);

  MainlandingItemModel mainlandingItemModelObj;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      imagePath: ImageConstant.imgImage15,
      height: getVerticalSize(
        58,
      ),
      width: getHorizontalSize(
        80,
      ),
    );
  }
}
