import '../models/listprice_item_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListpriceItemWidget extends StatelessWidget {
  ListpriceItemWidget(this.listpriceItemModelObj);

  ListpriceItemModel listpriceItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgImage56x561,
          height: getSize(
            56,
          ),
          width: getSize(
            56,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              28,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 16,
            top: 7,
            bottom: 7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                listpriceItemModelObj.priceTxt,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtLatoMedium13,
              ),
              Padding(
                padding: getPadding(
                  top: 9,
                ),
                child: Text(
                  listpriceItemModelObj.descriptionTxt,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtLatoRegular12Gray600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
