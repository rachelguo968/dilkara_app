import '../cart_screen/widgets/cart_item_widget.dart';
import 'bloc/cart_bloc.dart';
import 'models/cart_item_model.dart';
import 'models/cart_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/app_bar/appbar_image.dart';
import 'package:dilkara/widgets/app_bar/appbar_title.dart';
import 'package:dilkara/widgets/app_bar/custom_app_bar.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(CartState(
        cartModelObj: CartModel(),
      ))
        ..add(CartInitialEvent()),
      child: CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            64,
          ),
          leadingWidth: 39,
          leading: AppbarImage(
            height: getSize(
              24,
            ),
            width: getSize(
              24,
            ),
            svgPath: ImageConstant.imgMenuBlack900,
            margin: getMargin(
              left: 15,
              top: 18,
              bottom: 22,
            ),
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "lbl_shopsie".tr,
          ),
          styleType: Style.bgFillWhiteA700,
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 24,
            bottom: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 26,
                  ),
                  child: Text(
                    "lbl_my_cart2".tr.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtLatoRegular18.copyWith(
                      letterSpacing: getHorizontalSize(
                        1.08,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 16,
                  top: 26,
                  right: 16,
                ),
                child: BlocSelector<CartBloc, CartState, CartModel?>(
                  selector: (state) => state.cartModelObj,
                  builder: (context, cartModelObj) {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: getPadding(
                            top: 16.0,
                            bottom: 16.0,
                          ),
                          child: SizedBox(
                            width: getHorizontalSize(
                              358,
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
                      itemCount: cartModelObj?.cartItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        CartItemModel model =
                            cartModelObj?.cartItemList[index] ??
                                CartItemModel();
                        return CartItemWidget(
                          model,
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 98,
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
              Padding(
                padding: getPadding(
                  left: 16,
                  top: 21,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 2,
                        bottom: 2,
                      ),
                      child: Text(
                        "lbl_sub_total2".tr.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtLatoSemiBold14Gray90001,
                      ),
                    ),
                    Text(
                      "lbl_111_80".tr.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtLatoRegular18.copyWith(
                        letterSpacing: getHorizontalSize(
                          1.08,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 21,
                  bottom: 5,
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
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(
            48,
          ),
          text: "lbl_pay_111_80".tr.toUpperCase(),
          margin: getMargin(
            left: 32,
            right: 32,
            bottom: 64,
          ),
        ),
      ),
    );
  }
}
