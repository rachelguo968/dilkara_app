import '../models/list1_item_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class List1ItemWidget extends StatelessWidget {
  List1ItemWidget(this.list1ItemModelObj);

  List1ItemModel list1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage171x1711,
          height: getSize(
            171,
          ),
          width: getSize(
            171,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              8,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 11,
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "lbl_long".tr,
                  style: TextStyle(
                    color: ColorConstant.gray90001,
                    fontSize: getFontSize(
                      13,
                    ),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    letterSpacing: getHorizontalSize(
                      0.39,
                    ),
                  ),
                ),
                TextSpan(
                  text: "lbl_sleeve_t_shirt".tr,
                  style: TextStyle(
                    color: ColorConstant.gray90001,
                    fontSize: getFontSize(
                      13,
                    ),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
