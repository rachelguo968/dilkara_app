import 'bloc/profile_profile_info_tab_container_bloc.dart';
import 'models/profile_profile_info_tab_container_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/presentation/profile_address_details_page/profile_address_details_page.dart';
import 'package:dilkara/presentation/profile_my_orders_page/profile_my_orders_page.dart';
import 'package:dilkara/presentation/profile_profile_info_page/profile_profile_info_page.dart';
import 'package:dilkara/presentation/profile_security_page/profile_security_page.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:dilkara/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ProfileProfileInfoTabContainerScreen extends StatefulWidget {
  @override
  _ProfileProfileInfoTabContainerScreenState createState() =>
      _ProfileProfileInfoTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileProfileInfoTabContainerBloc>(
        create: (context) => ProfileProfileInfoTabContainerBloc(
            ProfileProfileInfoTabContainerState(
                profileProfileInfoTabContainerModelObj:
                    ProfileProfileInfoTabContainerModel()))
          ..add(ProfileProfileInfoTabContainerInitialEvent()),
        child: ProfileProfileInfoTabContainerScreen());
  }

  onTapArrowleft1(BuildContext context) {
    NavigatorService.goBack();
  }
}

// ignore_for_file: must_be_immutable
class _ProfileProfileInfoTabContainerScreenState
    extends State<ProfileProfileInfoTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController group5706Controller;

  @override
  void initState() {
    super.initState();
    group5706Controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileProfileInfoTabContainerBloc,
        ProfileProfileInfoTabContainerState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              appBar: CustomAppBar(
                  height: getVerticalSize(64),
                  leadingWidth: 40,
                  leading: AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath:
                          ImageConstant.img25326b4294154be2a5c5f0d7c083e855,
                      margin: getMargin(left: 16, top: 20, bottom: 20),
                      onTap: () {
                        onTapArrowleft1(context);
                      }),
                  centerTitle: true,
                  title: AppbarTitle(text: "lbl_shopsie".tr),
                  styleType: Style.bgFillWhiteA700),
              body: Container(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: double.maxFinite,
                            child: Container(
                                padding: getPadding(
                                    left: 104, top: 32, right: 104, bottom: 32),
                                decoration: AppDecoration.fillGray5001,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: getVerticalSize(116),
                                          width: getHorizontalSize(100),
                                          child: Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgProfileimage100x100,
                                                    height: getSize(100),
                                                    width: getSize(100),
                                                    radius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                50)),
                                                    alignment:
                                                        Alignment.topCenter),
                                                CustomIconButton(
                                                    height: 32,
                                                    width: 32,
                                                    margin: getMargin(left: 31),
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgC57ba486ba4c404b89f72e3001eb7290))
                                              ])),
                                      Padding(
                                          padding: getPadding(top: 10),
                                          child: Text(
                                              "lbl_archie_copeland"
                                                  .tr
                                                  .toUpperCase(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtLatoRegular18
                                                  .copyWith(
                                                      letterSpacing:
                                                          getHorizontalSize(
                                                              1.08)))),
                                      Padding(
                                          padding: getPadding(top: 13),
                                          child: Text("msg_allentown_new".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtLatoRegular14))
                                    ]))),
                        Container(
                            height: getVerticalSize(30),
                            width: double.maxFinite,
                            margin: getMargin(top: 18),
                            child: TabBar(
                                controller: group5706Controller,
                                labelColor: ColorConstant.indigoA200,
                                labelStyle: TextStyle(
                                    fontSize: getFontSize(14),
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400),
                                unselectedLabelColor: ColorConstant.gray600,
                                unselectedLabelStyle: TextStyle(
                                    fontSize: getFontSize(14),
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400),
                                indicatorColor: ColorConstant.indigoA200,
                                tabs: [
                                  Tab(
                                      child: Text("lbl_profile_info".tr,
                                          overflow: TextOverflow.ellipsis)),
                                  Tab(
                                      child: Text("lbl_my_orders".tr,
                                          overflow: TextOverflow.ellipsis)),
                                  Tab(
                                      child: Text("lbl_security".tr,
                                          overflow: TextOverflow.ellipsis)),
                                  Tab(
                                      child: Text("lbl_address_details".tr,
                                          overflow: TextOverflow.ellipsis)),
                                  Tab(
                                      child: Text("lbl_log_out".tr,
                                          overflow: TextOverflow.ellipsis))
                                ])),
                        Container(
                            height: getVerticalSize(443),
                            child: TabBarView(
                                controller: group5706Controller,
                                children: [
                                  ProfileProfileInfoPage.builder(context),
                                  ProfileMyOrdersPage.builder(context),
                                  ProfileSecurityPage.builder(context),
                                  ProfileAddressDetailsPage.builder(context),
                                  ProfileAddressDetailsPage.builder(context)
                                ]))
                      ]))));
    });
  }

  onTapArrowleft1(BuildContext context) {
    NavigatorService.goBack();
  }
}
