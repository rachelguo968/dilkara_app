import '../product_search_screen/widgets/list1_item_widget.dart';
import 'bloc/product_search_bloc.dart';
import 'models/list1_item_model.dart';
import 'models/product_search_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class ProductSearchScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<ProductSearchBloc>(
      create: (context) => ProductSearchBloc(ProductSearchState(
        productSearchModelObj: ProductSearchModel(),
      ))
        ..add(ProductSearchInitialEvent()),
      child: ProductSearchScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 11,
            top: 24,
            right: 11,
            bottom: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocSelector<ProductSearchBloc, ProductSearchState,
                  TextEditingController?>(
                selector: (state) => state.group5609Controller,
                builder: (context, group5609Controller) {
                  return CustomSearchView(
                    focusNode: FocusNode(),
                    controller: group5609Controller,
                    hintText: "lbl_sl_iders".tr.toUpperCase(),
                    prefix: Container(
                      margin: getMargin(
                        left: 10,
                        top: 18,
                        right: 6,
                        bottom: 18,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        56,
                      ),
                    ),
                    suffix: Container(
                      margin: getMargin(
                        left: 30,
                        top: 19,
                        right: 10,
                        bottom: 17,
                      ),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgClose,
                      ),
                    ),
                    suffixConstraints: BoxConstraints(
                      maxHeight: getVerticalSize(
                        56,
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: getPadding(
                  left: 5,
                  top: 29,
                  right: 5,
                ),
                child: BlocSelector<ProductSearchBloc, ProductSearchState,
                    ProductSearchModel?>(
                  selector: (state) => state.productSearchModelObj,
                  builder: (context, productSearchModelObj) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: getVerticalSize(
                          199,
                        ),
                        crossAxisCount: 2,
                        mainAxisSpacing: getHorizontalSize(
                          16,
                        ),
                        crossAxisSpacing: getHorizontalSize(
                          16,
                        ),
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          productSearchModelObj?.list1ItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        List1ItemModel model =
                            productSearchModelObj?.list1ItemList[index] ??
                                List1ItemModel();
                        return List1ItemWidget(
                          model,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
