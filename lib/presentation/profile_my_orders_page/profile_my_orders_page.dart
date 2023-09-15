import '../profile_my_orders_page/widgets/listprice1_item_widget.dart';
import 'bloc/profile_my_orders_bloc.dart';
import 'models/listprice1_item_model.dart';
import 'models/profile_my_orders_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ProfileMyOrdersPage extends StatefulWidget {
  @override
  _ProfileMyOrdersPageState createState() => _ProfileMyOrdersPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileMyOrdersBloc>(
      create: (context) => ProfileMyOrdersBloc(ProfileMyOrdersState(
        profileMyOrdersModelObj: ProfileMyOrdersModel(),
      ))
        ..add(ProfileMyOrdersInitialEvent()),
      child: ProfileMyOrdersPage(),
    );
  }
}

class _ProfileMyOrdersPageState extends State<ProfileMyOrdersPage>
    with AutomaticKeepAliveClientMixin<ProfileMyOrdersPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 36,
                    right: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_orders".tr.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtLatoSemiBold13Gray90001,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 23,
                          right: 131,
                        ),
                        child: BlocSelector<ProfileMyOrdersBloc,
                            ProfileMyOrdersState, ProfileMyOrdersModel?>(
                          selector: (state) => state.profileMyOrdersModelObj,
                          builder: (context, profileMyOrdersModelObj) {
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: getPadding(
                                    top: 15.5,
                                    bottom: 15.5,
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
                              itemCount: profileMyOrdersModelObj
                                      ?.listprice1ItemList.length ??
                                  0,
                              itemBuilder: (context, index) {
                                Listprice1ItemModel model =
                                    profileMyOrdersModelObj
                                            ?.listprice1ItemList[index] ??
                                        Listprice1ItemModel();
                                return Listprice1ItemWidget(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
