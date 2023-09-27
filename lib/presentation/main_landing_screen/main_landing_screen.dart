import '../main_landing_screen/widgets/listitemname_item_widget.dart';
import '../main_landing_screen/widgets/listprice_item_widget.dart';
import '../main_landing_screen/widgets/mainlanding_item_widget.dart';
import 'bloc/main_landing_bloc.dart';
import 'models/listitemname_item_model.dart';
import 'models/listprice_item_model.dart';
import 'models/main_landing_model.dart';
import 'models/mainlanding_item_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:dilkara/widgets/custom_drop_down.dart';
import 'package:dilkara/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/presentation/product_page_screen/product_page_screen.dart';
import 'package:dilkara/services/woocommerce_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


final apiUrl = "https://dilkara.com.au/wc-api/v3";
final consumerKey = "ck_5548abde185d8a83fa7781e7c6bce5459f52616c";
final consumerSecret = "cs_6ae6830cba04c992ed7bf63ed36f5d1015661015";
final apiService = WooCommerceApiService(apiUrl, consumerKey, consumerSecret);


Future<List<Map<String, dynamic>>> fetchProducts()  async {
  final response = await apiService.fetchProducts();
  if (response is Map<String, dynamic> && response.containsKey('products')) {
    // Handle the map structure here and extract the list of products
    final productList = response['products'] as List<dynamic>;
    return productList.cast<Map<String, dynamic>>().toList();
  } else {
    // Handle the case where the response is not as expected
    throw Exception('Unexpected API response format');
  }
}

class Product {
  final String name;
  final String imageUrl;

  Product({required this.name, required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      imageUrl: json['images'][0]['src'],
    );
  }
}


class MainLandingScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<MainLandingBloc>(
      create: (context) => MainLandingBloc(MainLandingState(
        mainLandingModelObj: MainLandingModel(),
      ))
        ..add(MainLandingInitialEvent()),
      child: MainLandingScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(
            43,
          ),
          leadingWidth: 32,
          leading: AppbarImage(
            height: getVerticalSize(
              16,
            ),
            width: getHorizontalSize(
              20,
            ),
            svgPath: ImageConstant.imgMenuBlack900,
            margin: getMargin(
              left: 12,
              top: 1,
              bottom: 5,
            ),
            onTap: () {
              NavigatorService.navigatorKey.currentState!
                  .pushNamed(AppRoutes.appNavigationScreen);
            },
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "Dilkara".tr,
          ),
          actions: [
            AppbarImage(
              height: getSize(
                15,
              ),
              width: getSize(
                15,
              ),
              svgPath: ImageConstant.imgSearchGray90001,
              margin: getMargin(
                left: 16,
                top: 1,
                right: 5,
                bottom: 1,
              ),
              onTap: () {
                NavigatorService.navigatorKey.currentState!
                    .pushNamed(AppRoutes.productSearchScreen);
              },
            ),
            AppbarImage(
              height: getVerticalSize(
                17,
              ),
              width: getHorizontalSize(
                18,
              ),
              svgPath: ImageConstant.imgCart,
              margin: getMargin(
                left: 10,
                right: 5,
              ),
              onTap: () {
                NavigatorService.navigatorKey.currentState!
                    .pushNamed(AppRoutes.cartScreen);
              },
            ),
            AppbarImage(
              height: getVerticalSize(
                15,
              ),
              width: getHorizontalSize(
                13,
              ),
              svgPath: ImageConstant.imgUser,
              margin: getMargin(
                left: 10,
                top: 1,
                right: 21,
                bottom: 1,
              ),
              onTap: () {
                NavigatorService.navigatorKey.currentState!
                    .pushNamed(AppRoutes.profileProfileInfoTabContainerScreen);
              },
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(
                top: 20,
                bottom: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Container(
                      decoration: AppDecoration.fillGray200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: getVerticalSize(
                              362,
                            ),
                            width: getHorizontalSize(
                              360,
                            ),
                            margin: getMargin(
                              top: 24,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgImage61,
                                  height: getVerticalSize(
                                    362,
                                  ),
                                  width: getHorizontalSize(
                                    360,
                                  ),
                                  radius: BorderRadius.only(
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
                                  ),
                                  alignment: Alignment.center,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 60,
                                      right: 59,
                                      bottom: 14,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_season_sale2".tr.toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPlayfairDisplayRomanBold36,
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 3,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "lbl_up_to"
                                                      .tr
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: getFontSize(
                                                      18,
                                                    ),
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.gray90001,
                                                    fontSize: getFontSize(
                                                      48,
                                                    ),
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "lbl_60_off"
                                                      .tr
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.gray200,
                                                    fontSize: getFontSize(
                                                      36,
                                                    ),
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(child:ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPageScreen(apiService)));},
                              child: Text('Go to Product Page')),),
                          CustomImageView(
                            svgPath: ImageConstant.imgUnion,
                            height: getVerticalSize(
                              48,
                            ),
                            width: getHorizontalSize(
                              134,
                            ),
                            margin: getMargin(
                              top: 32,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgImage60123x390,
                            height: getVerticalSize(
                              123,
                            ),
                            width: getHorizontalSize(
                              390,
                            ),
                            margin: getMargin(
                              top: 48,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 66,
                    ),
                    child: Text(
                      "lbl_trending_now".tr.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtLatoRegular18.copyWith(
                        letterSpacing: getHorizontalSize(
                          1.08,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 16,
                        top: 34,
                        right: 53,
                      ),
                      child: Row(
                        children: [
                          CustomButton(
                            height: getVerticalSize(
                              32,
                            ),
                            width: getHorizontalSize(
                              20,
                            ),
                            text: "Shop".tr,
                            padding: ButtonPadding.PaddingAll8,
                            fontStyle: ButtonFontStyle.LatoRegular13,
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              32,
                            ),
                            width: getHorizontalSize(
                              20,
                            ),
                            text: "Skin".tr,
                            margin: getMargin(
                              left: 8,
                            ),
                            variant: ButtonVariant.Stroke,
                            padding: ButtonPadding.PaddingAll8,
                            fontStyle: ButtonFontStyle.LatoRegular13Gray90001,
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              32,
                            ),
                            width: getHorizontalSize(
                              20,
                            ),
                            text: "Hair".tr,
                            margin: getMargin(
                              left: 8,
                            ),
                            variant: ButtonVariant.Stroke,
                            padding: ButtonPadding.PaddingAll8,
                            fontStyle: ButtonFontStyle.LatoRegular13Gray90001,
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              32,
                            ),
                            width: getHorizontalSize(
                              20,
                            ),
                            text: "Treat".tr,
                            margin: getMargin(
                              left: 8,
                            ),
                            variant: ButtonVariant.Stroke,
                            padding: ButtonPadding.PaddingAll8,
                            fontStyle: ButtonFontStyle.LatoRegular13Gray90001,
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              32,
                            ),
                            width: getHorizontalSize(
                              20,
                            ),
                            text: "Style".tr,
                            margin: getMargin(
                              left: 8,
                            ),
                            variant: ButtonVariant.Stroke,
                            padding: ButtonPadding.PaddingAll8,
                            fontStyle: ButtonFontStyle.LatoRegular13Gray90001,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: getVerticalSize(
                        320,
                      ), //interactive button show top3 products of each category, edit listItemname?
                        child: BlocSelector<MainLandingBloc, MainLandingState,
                            MainLandingModel?>(
                          selector: (state) => state.mainLandingModelObj,
                          builder: (context, mainLandingModelObj) {
                            return ListView.separated(
                              padding: getPadding(
                                left: 16,
                                top: 32,
                              ),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    10,
                                  ),
                                );
                              },
                              itemCount: mainLandingModelObj
                                  ?.listitemnameItemList.length ??
                                  0,
                              itemBuilder: (context, index) {
                                ListitemnameItemModel model = mainLandingModelObj
                                    ?.listitemnameItemList[index] ??
                                    ListitemnameItemModel();
                                return ListitemnameItemWidget(
                                  model,
                                );
                              },
                            );
                          },
                        ),
                    ),
                  ),

                  Container(
                    width: double.maxFinite,
                    child: Container(
                      margin: getMargin(
                        top: 45,
                      ),
                      padding: getPadding(
                        left: 19,
                        top: 40,
                        right: 19,
                        bottom: 40,
                      ),
                      decoration: AppDecoration.fillBlack900,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 49,
                            ),
                            child: Text(
                              "lbl_new_arrival2".tr.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPlayfairDisplayRomanRegular35
                                  .copyWith(
                                letterSpacing: getHorizontalSize(
                                  4.9,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: getPadding(
                                left: 133,
                                top: 6,
                              ),
                              child: Text(
                                "lbl_fall_20212".tr.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtLatoSemiBold14,
                              ),
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            child: Container(
                              margin: getMargin(
                                top: 69,
                              ),
                              padding: getPadding(
                                left: 18,
                                right: 18,
                              ),
                              decoration:
                                  AppDecoration.outlineBluegray10063.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL279,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    child: Container(
                                      margin: getMargin(
                                        top: 15,
                                      ),
                                      padding: getPadding(
                                        left: 10,
                                        right: 10,
                                      ),
                                      decoration: AppDecoration
                                          .outlineBluegray10075
                                          .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.customBorderTL279,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomImageView(
                                            imagePath: ImageConstant
                                                .imgRectangle1381354x292,
                                            height: getVerticalSize(
                                              354,
                                            ),
                                            width: getHorizontalSize(
                                              292,
                                            ),
                                            radius: BorderRadius.only(
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
                                            ),
                                            margin: getMargin(
                                              top: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomButton(
                            height: getVerticalSize(
                              48,
                            ),
                            width: getHorizontalSize(
                              174,
                            ),
                            text: "lbl_explore".tr.toUpperCase(),
                            margin: getMargin(
                              top: 40,
                            ),
                            variant: ButtonVariant.FillWhiteA700,
                            fontStyle: ButtonFontStyle.LatoSemiBold13IndigoA200,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 43,
                    ),
                    child: Text(
                      "msg_recomended_look".tr.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtLatoRegular18.copyWith(
                        letterSpacing: getHorizontalSize(
                          1.08,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 16,
                        top: 44,
                        right: 95,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: getPadding(
                              bottom: 1,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_gender".tr,
                                    style: TextStyle(
                                      color: ColorConstant.gray600,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "lbl".tr,
                                    style: TextStyle(
                                      color: ColorConstant.gray60002,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          BlocSelector<MainLandingBloc, MainLandingState,
                              MainLandingModel?>(
                            selector: (state) => state.mainLandingModelObj,
                            builder: (context, mainLandingModelObj) {
                              return CustomDropDown(
                                width: getHorizontalSize(
                                  67,
                                ),
                                focusNode: FocusNode(),
                                icon: Container(
                                  margin: getMargin(
                                    left: 2,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgArrowdown,
                                  ),
                                ),
                                hintText: "lbl_female".tr,
                                margin: getMargin(
                                  left: 10,
                                  bottom: 1,
                                ),
                                items:
                                    mainLandingModelObj?.dropdownItemList ?? [],
                                onChanged: (value) {
                                  context
                                      .read<MainLandingBloc>()
                                      .add(ChangeDropDownEvent(value: value));
                                },
                              );
                            },
                          ),
                          Padding(
                            padding: getPadding(
                              left: 20,
                              top: 1,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_style".tr,
                                    style: TextStyle(
                                      color: ColorConstant.gray600,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "lbl2".tr,
                                    style: TextStyle(
                                      color: ColorConstant.gray60002,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          BlocSelector<MainLandingBloc, MainLandingState,
                              MainLandingModel?>(
                            selector: (state) => state.mainLandingModelObj,
                            builder: (context, mainLandingModelObj) {
                              return CustomDropDown(
                                width: getHorizontalSize(
                                  87,
                                ),
                                focusNode: FocusNode(),
                                icon: Container(
                                  margin: getMargin(
                                    left: 2,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgArrowdown,
                                  ),
                                ),
                                hintText: "lbl_partywear".tr,
                                margin: getMargin(
                                  left: 10,
                                  top: 1,
                                ),
                                items: mainLandingModelObj?.dropdownItemList1 ??
                                    [],
                                onChanged: (value) {
                                  context
                                      .read<MainLandingBloc>()
                                      .add(ChangeDropDown1Event(value: value));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: getPadding(
                        left: 16,
                        top: 7,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: getPadding(
                              top: 1,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_price_range".tr,
                                    style: TextStyle(
                                      color: ColorConstant.gray600,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "lbl2".tr,
                                    style: TextStyle(
                                      color: ColorConstant.gray60002,
                                      fontSize: getFontSize(
                                        14,
                                      ),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          BlocSelector<MainLandingBloc, MainLandingState,
                              MainLandingModel?>(
                            selector: (state) => state.mainLandingModelObj,
                            builder: (context, mainLandingModelObj) {
                              return CustomDropDown(
                                width: getHorizontalSize(
                                  31,
                                ),
                                focusNode: FocusNode(),
                                icon: Container(
                                  margin: getMargin(
                                    left: 2,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgArrowdown,
                                  ),
                                ),
                                hintText: "lbl_all".tr,
                                margin: getMargin(
                                  left: 10,
                                  bottom: 1,
                                ),
                                items: mainLandingModelObj?.dropdownItemList2 ??
                                    [],
                                onChanged: (value) {
                                  context
                                      .read<MainLandingBloc>()
                                      .add(ChangeDropDown2Event(value: value));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      left: 16,
                      top: 21,
                      right: 16,
                    ),
                    padding: getPadding(
                      all: 6,
                    ),
                    decoration: AppDecoration.stroke,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgRectangle1385,
                          height: getVerticalSize(
                            407,
                          ),
                          width: getHorizontalSize(
                            346,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                            top: 31,
                          ),
                          child: Text(
                            "lbl_in_this_look".tr.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoSemiBold14Gray90001,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 10,
                            top: 35,
                            right: 80,
                          ),
                          child: BlocSelector<MainLandingBloc, MainLandingState,
                              MainLandingModel?>(
                            selector: (state) => state.mainLandingModelObj,
                            builder: (context, mainLandingModelObj) {
                              return ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: getPadding(
                                      top: 12.0,
                                      bottom: 12.0,
                                    ),
                                    child: SizedBox(
                                      width: getHorizontalSize(
                                        243,
                                      ),
                                      child: Divider(
                                        height: getVerticalSize(
                                          1,
                                        ),
                                        thickness: getVerticalSize(
                                          1,
                                        ),
                                        color: ColorConstant.gray200,
                                      ),
                                    ),
                                  );
                                },
                                itemCount: mainLandingModelObj
                                        ?.listpriceItemList.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  ListpriceItemModel model = mainLandingModelObj
                                          ?.listpriceItemList[index] ??
                                      ListpriceItemModel();
                                  return ListpriceItemWidget(
                                    model,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: getPadding(
                              top: 12,
                            ),
                            child: Divider(
                              height: getVerticalSize(
                                1,
                              ),
                              thickness: getVerticalSize(
                                1,
                              ),
                              color: ColorConstant.gray200,
                              indent: getHorizontalSize(
                                82,
                              ),
                              endIndent: getHorizontalSize(
                                21,
                              ),
                            ),
                          ),
                        ),
                        CustomButton(
                          height: getVerticalSize(
                            48,
                          ),
                          text: "lbl_buy_it_now".tr.toUpperCase(),
                          margin: getMargin(
                            left: 10,
                            top: 19,
                            right: 10,
                            bottom: 18,
                          ),
                          variant: ButtonVariant.OutlineIndigoA200,
                          fontStyle: ButtonFontStyle.LatoSemiBold13IndigoA200,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 49,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            left: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Container(
                      margin: getMargin(
                        top: 64,
                      ),
                      padding: getPadding(
                        left: 16,
                        top: 32,
                        right: 16,
                        bottom: 32,
                      ),
                      decoration: AppDecoration.fillBlue50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgImage14204x231,
                            height: getVerticalSize(
                              204,
                            ),
                            width: getHorizontalSize(
                              231,
                            ),
                            radius: BorderRadius.circular(
                              getHorizontalSize(
                                12,
                              ),
                            ),
                            margin: getMargin(
                              top: 8,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 42,
                            ),
                            child: Text(
                              "lbl_get_20_off".tr.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoRegular18.copyWith(
                                letterSpacing: getHorizontalSize(
                                  1.08,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 15,
                            ),
                            child: Text(
                              "msg_leave_your_emai".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoRegular14Gray60003,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 28,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocSelector<MainLandingBloc, MainLandingState,
                                    TextEditingController?>(
                                  selector: (state) =>
                                      state.groupThreeController,
                                  builder: (context, groupThreeController) {
                                    return CustomTextFormField(
                                      width: getHorizontalSize(
                                        234,
                                      ),
                                      focusNode: FocusNode(),
                                      controller: groupThreeController,
                                      hintText: "lbl_email".tr,
                                      variant:
                                          TextFormFieldVariant.FillWhiteA700ab,
                                      padding:
                                          TextFormFieldPadding.PaddingAll11,
                                      fontStyle: TextFormFieldFontStyle
                                          .LatoMedium13Bluegray40001,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.emailAddress,
                                    );
                                  },
                                ),
                                CustomButton(
                                  height: getVerticalSize(
                                    40,
                                  ),
                                  width: getHorizontalSize(
                                    114,
                                  ),
                                  text: "lbl_subscribe".tr,
                                  fontStyle:
                                      ButtonFontStyle.LatoMedium13WhiteA700,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: getPadding(
                      left: 16,
                      top: 24,
                      right: 16,
                      bottom: 24,
                    ),
                    decoration: AppDecoration.primary,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 22,
                          ),
                          child: Text(
                            "2023_Dilkara".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoRegular12Gray600,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: getPadding(
                            bottom: 22,
                          ),
                          child: Text(
                            "msg_privacy_cooki".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoRegular12Gray200,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 32,
                            right: 6,
                            bottom: 23,
                          ),
                          child: Text(
                            "lbl_ts_cs".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtLatoRegular12Gray200,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
