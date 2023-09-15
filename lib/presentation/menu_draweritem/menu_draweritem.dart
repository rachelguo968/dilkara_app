import 'bloc/menu_bloc.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

class MenuDraweritem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            width: getHorizontalSize(310),
            padding: getPadding(left: 67, top: 34, right: 67, bottom: 34),
            decoration: AppDecoration.fillWhiteA700,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: getPadding(left: 58, top: 36),
                      child: Text("lbl_cart".tr.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoRegular18.copyWith(
                              letterSpacing: getHorizontalSize(1.08)))),
                  Padding(
                      padding: getPadding(left: 44, top: 29),
                      child: Text("lbl_profile".tr.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoRegular18.copyWith(
                              letterSpacing: getHorizontalSize(1.08)))),
                  Padding(
                      padding: getPadding(left: 33, top: 29),
                      child: Text("lbl_clothing".tr.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoRegular18.copyWith(
                              letterSpacing: getHorizontalSize(1.08)))),
                  Padding(
                      padding: getPadding(left: 51, top: 29),
                      child: Text("lbl_shoes".tr.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoRegular18.copyWith(
                              letterSpacing: getHorizontalSize(1.08)))),
                  Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                        child: CustomImageView(
                            svgPath: ImageConstant.imgEye26x26,
                            height: getSize(26),
                            width: getSize(26),
                            margin: getMargin(right: 12))),
                    Expanded(
                        child: CustomImageView(
                            svgPath: ImageConstant.imgFacebook26x26,
                            height: getSize(26),
                            width: getSize(26),
                            margin: getMargin(left: 12, right: 12),
                            onTap: () {
                              onTapImgFacebook(context);
                            })),
                    Expanded(
                        child: CustomImageView(
                            svgPath: ImageConstant.imgSettings,
                            height: getSize(26),
                            width: getSize(26),
                            margin: getMargin(left: 12, right: 12))),
                    Expanded(
                        child: CustomImageView(
                            svgPath:
                                ImageConstant.img5279123tweettwittertwitter,
                            height: getSize(26),
                            width: getSize(26),
                            margin: getMargin(left: 12)))
                  ])
                ])));
  }

  onTapImgFacebook(BuildContext context) async {
    var url = 'https://www.facebook.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://www.facebook.com/login/';
    }
  }
}
