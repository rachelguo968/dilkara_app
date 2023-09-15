import 'bloc/profile_security_bloc.dart';
import 'models/profile_security_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:dilkara/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ProfileSecurityPage extends StatefulWidget {
  @override
  _ProfileSecurityPageState createState() => _ProfileSecurityPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileSecurityBloc>(
      create: (context) => ProfileSecurityBloc(ProfileSecurityState(
        profileSecurityModelObj: ProfileSecurityModel(),
      ))
        ..add(ProfileSecurityInitialEvent()),
      child: ProfileSecurityPage(),
    );
  }
}

class _ProfileSecurityPageState extends State<ProfileSecurityPage>
    with AutomaticKeepAliveClientMixin<ProfileSecurityPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 94,
                    right: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_change_password".tr.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtLatoSemiBold13Gray90001,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 25,
                        ),
                        child: Text(
                          "msg_current_passwor".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoMedium13Gray90002,
                        ),
                      ),
                      BlocSelector<ProfileSecurityBloc, ProfileSecurityState,
                          TextEditingController?>(
                        selector: (state) => state.group5627Controller,
                        builder: (context, group5627Controller) {
                          return CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: group5627Controller,
                            hintText: "lbl_password".tr,
                            margin: getMargin(
                              top: 14,
                            ),
                            textInputType: TextInputType.visiblePassword,
                            isObscureText: true,
                          );
                        },
                      ),
                      Padding(
                        padding: getPadding(
                          top: 25,
                        ),
                        child: Text(
                          "lbl_new_password".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoMedium13Gray90002,
                        ),
                      ),
                      BlocSelector<ProfileSecurityBloc, ProfileSecurityState,
                          TextEditingController?>(
                        selector: (state) => state.group5627OneController,
                        builder: (context, group5627OneController) {
                          return CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: group5627OneController,
                            hintText: "lbl_password".tr,
                            margin: getMargin(
                              top: 14,
                            ),
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            isObscureText: true,
                          );
                        },
                      ),
                      CustomButton(
                        height: getVerticalSize(
                          48,
                        ),
                        text: "lbl_update_password".tr.toUpperCase(),
                        margin: getMargin(
                          top: 24,
                        ),
                        variant: ButtonVariant.FillGray300,
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
