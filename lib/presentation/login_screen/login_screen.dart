import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:dilkara/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/domain/facebookauth/facebook_auth_helper.dart';
import 'package:dilkara/domain/googleauth/google_auth_helper.dart';

class LoginScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, right: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: getHorizontalSize(261),
                          margin: getMargin(left: 8, right: 88),
                          child: Text("msg_welcome_back_g".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoBold24.copyWith(
                                  letterSpacing: getHorizontalSize(0.72)))),
                      BlocSelector<LoginBloc, LoginState,
                              TextEditingController?>(
                          selector: (state) => state.group5614Controller,
                          builder: (context, group5614Controller) {
                            return CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: group5614Controller,
                                hintText: "msg_enter_your_emai".tr,
                                margin: getMargin(top: 37),
                                padding: TextFormFieldPadding.PaddingT14,
                                textInputType: TextInputType.emailAddress);
                          }),
                      BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                        return CustomTextFormField(
                            focusNode: FocusNode(),
                            controller: state.group5616Controller,
                            hintText: "msg_enter_your_pass".tr,
                            margin: getMargin(top: 15),
                            padding: TextFormFieldPadding.PaddingT15,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            suffix: InkWell(
                                onTap: () {
                                  context.read<LoginBloc>().add(
                                      ChangePasswordVisibilityEvent(
                                          value: !state.isShowPassword));
                                },
                                child: Container(
                                    margin: getMargin(
                                        left: 12,
                                        top: 12,
                                        right: 23,
                                        bottom: 12),
                                    child: CustomImageView(
                                        svgPath: state.isShowPassword
                                            ? ImageConstant.imgEye
                                            : ImageConstant.imgEye))),
                            suffixConstraints:
                                BoxConstraints(maxHeight: getVerticalSize(48)),
                            isObscureText: state.isShowPassword);
                      }),
                      CustomButton(
                          height: getVerticalSize(48),
                          text: "lbl_login".tr,
                          margin: getMargin(top: 24),
                          fontStyle: ButtonFontStyle.LatoMedium16WhiteA700),
                      Padding(
                          padding: getPadding(top: 38),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(top: 7, bottom: 8),
                                    child: SizedBox(
                                        width: getHorizontalSize(112),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.indigo50))),
                                Text("lbl_or_login_with".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtLatoRegular14Gray60001),
                                Padding(
                                    padding: getPadding(top: 7, bottom: 8),
                                    child: SizedBox(
                                        width: getHorizontalSize(111),
                                        child: Divider(
                                            height: getVerticalSize(1),
                                            thickness: getVerticalSize(1),
                                            color: ColorConstant.indigo50)))
                              ])),
                      Padding(
                          padding: getPadding(top: 21),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.whiteA700,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: ColorConstant.gray200,
                                            width: getHorizontalSize(1)),
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                    child: Container(
                                        height: getVerticalSize(56),
                                        width: getHorizontalSize(168),
                                        padding:
                                            getPadding(top: 15, bottom: 15),
                                        decoration: AppDecoration.white
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                        child: Stack(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgFacebook,
                                              height: getSize(26),
                                              width: getSize(26),
                                              alignment: Alignment.center,
                                              onTap: () {
                                                onTapImgFacebook(context);
                                              })
                                        ]))),
                                Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.whiteA700,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: ColorConstant.gray200,
                                            width: getHorizontalSize(1)),
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                    child: Container(
                                        height: getVerticalSize(56),
                                        width: getHorizontalSize(168),
                                        padding:
                                            getPadding(top: 15, bottom: 15),
                                        decoration: AppDecoration.white
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                        child: Stack(children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgGoogle,
                                              height: getSize(26),
                                              width: getSize(26),
                                              alignment: Alignment.center,
                                              onTap: () {
                                                onTapImgGoogle(context);
                                              })
                                        ])))
                              ])),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 43, bottom: 5),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_don_t_have_an".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray90001,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "lbl_account".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray90001,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: " ",
                                        style: TextStyle(
                                            color: ColorConstant.gray90001,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "lbl_register_now".tr,
                                        style: TextStyle(
                                            color: ColorConstant.indigoA200,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600))
                                  ]),
                                  textAlign: TextAlign.left)))
                    ]))));
  }

  onTapImgFacebook(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  onTapImgGoogle(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}
