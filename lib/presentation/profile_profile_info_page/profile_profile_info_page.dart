import 'bloc/profile_profile_info_bloc.dart';
import 'models/profile_profile_info_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:dilkara/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ProfileProfileInfoPage extends StatefulWidget {
  @override
  _ProfileProfileInfoPageState createState() => _ProfileProfileInfoPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileProfileInfoBloc>(
      create: (context) => ProfileProfileInfoBloc(ProfileProfileInfoState(
        profileProfileInfoModelObj: ProfileProfileInfoModel(),
      ))
        ..add(ProfileProfileInfoInitialEvent()),
      child: ProfileProfileInfoPage(),
    );
  }
}

class _ProfileProfileInfoPageState extends State<ProfileProfileInfoPage>
    with AutomaticKeepAliveClientMixin<ProfileProfileInfoPage> {
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
                    top: 36,
                    right: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "lbl_first_name".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtLatoMedium13Gray90002,
                      ),
                      BlocSelector<ProfileProfileInfoBloc,
                          ProfileProfileInfoState, TextEditingController?>(
                        selector: (state) => state.firstnameOneController,
                        builder: (context, firstnameOneController) {
                          return CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: firstnameOneController,
                            hintText: "lbl_archie".tr,
                            margin: getMargin(
                              top: 15,
                            ),
                            fontStyle:
                                TextFormFieldFontStyle.LatoRegular13Gray90002,
                          );
                        },
                      ),
                      Padding(
                        padding: getPadding(
                          top: 24,
                        ),
                        child: Text(
                          "lbl_last_name".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoMedium13Gray90002,
                        ),
                      ),
                      BlocSelector<ProfileProfileInfoBloc,
                          ProfileProfileInfoState, TextEditingController?>(
                        selector: (state) => state.lastnameOneController,
                        builder: (context, lastnameOneController) {
                          return CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: lastnameOneController,
                            hintText: "lbl_copeland".tr,
                            margin: getMargin(
                              top: 15,
                            ),
                            fontStyle:
                                TextFormFieldFontStyle.LatoRegular13Gray90002,
                          );
                        },
                      ),
                      Padding(
                        padding: getPadding(
                          top: 24,
                        ),
                        child: Text(
                          "lbl_email_address".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoMedium13Gray90002,
                        ),
                      ),
                      BlocSelector<ProfileProfileInfoBloc,
                          ProfileProfileInfoState, TextEditingController?>(
                        selector: (state) => state.emailaddressController,
                        builder: (context, emailaddressController) {
                          return CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: emailaddressController,
                            hintText: "msg_archiecopeland_gmail_com".tr,
                            margin: getMargin(
                              top: 15,
                            ),
                            fontStyle:
                                TextFormFieldFontStyle.LatoRegular13Gray90002,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress,
                          );
                        },
                      ),
                      CustomButton(
                        height: getVerticalSize(
                          48,
                        ),
                        text: "lbl_save_edits".tr.toUpperCase(),
                        margin: getMargin(
                          top: 31,
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
