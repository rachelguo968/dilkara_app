import '../models/list_item_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListItemWidget extends StatelessWidget {
  ListItemWidget(this.listItemModelObj);

  ListItemModel listItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage236x1713,
          height: getVerticalSize(
            236,
          ),
          width: getHorizontalSize(
            171,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              8,
            ),
          ),
        ),
        Container(
          width: getHorizontalSize(
            158,
          ),
          margin: getMargin(
            top: 10,
          ),
          child: Text(
            listItemModelObj.nameTxt,
            maxLines: null,
            textAlign: TextAlign.left,
            style: AppStyle.txtLatoRegular13.copyWith(
              letterSpacing: getHorizontalSize(
                0.39,
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 10,
          ),
          child: Text(
            listItemModelObj.priceTxt,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtLatoSemiBold13,
          ),
        ),
      ],
    );
  }
}
