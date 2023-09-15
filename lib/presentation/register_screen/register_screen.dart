import 'bloc/register_bloc.dart';
import 'models/register_model.dart';
import 'package:dilkara/core/app_export.dart';
import 'package:dilkara/widgets/custom_button.dart';
import 'package:dilkara/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:dilkara/domain/facebookauth/facebook_auth_helper.dart';
import 'package:dilkara/domain/googleauth/google_auth_helper.dart';

class RegisterScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<RegisterBloc>(
        create: (context) =>
            RegisterBloc(RegisterState(registerModelObj: RegisterModel()))
              ..add(RegisterInitialEvent()),
        child: RegisterScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 15, top: 98, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("msg_hello_register".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLatoBold24.copyWith(
                              letterSpacing: getHorizontalSize(0.72))),
                      BlocSelector<RegisterBloc, RegisterState,
                              TextEditingController?>(
                          selector: (state) => state.firstnameController,
                          builder: (context, firstnameController) {
                            return CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: firstnameController,
                                hintText: "lbl_first_name".tr,
                                margin: getMargin(left: 1, top: 40));
                          }),
                      BlocSelector<RegisterBloc, RegisterState,
                              TextEditingController?>(
                          selector: (state) => state.lastnameController,
                          builder: (context, lastnameController) {
                            return CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: lastnameController,
                                hintText: "lbl_last_name".tr,
                                margin: getMargin(left: 1, top: 12));
                          }),
                      BlocSelector<RegisterBloc, RegisterState,
                              TextEditingController?>(
                          selector: (state) => state.emailController,
                          builder: (context, emailController) {
                            return CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: emailController,
                                hintText: "lbl_email".tr,
                                margin: getMargin(left: 1, top: 12),
                                textInputType: TextInputType.emailAddress);
                          }),
                      BlocSelector<RegisterBloc, RegisterState,
                              TextEditingController?>(
                          selector: (state) => state.passwordController,
                          builder: (context, passwordController) {
                            return CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: passwordController,
                                hintText: "lbl_password".tr,
                                margin: getMargin(left: 1, top: 12),
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                isObscureText: true);
                          }),
                      CustomButton(
                          height: getVerticalSize(48),
                          text: "lbl_register".tr,
                          margin: getMargin(left: 1, top: 24),
                          fontStyle: ButtonFontStyle.LatoMedium16WhiteA700),
                      Padding(
                          padding: getPadding(left: 1, top: 38, right: 1),
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
                          padding: getPadding(left: 1, top: 21, right: 1),
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
                                        text: "msg_already_have_an2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.gray90001,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: " ",
                                        style: TextStyle(
                                            color: ColorConstant.gray900,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "lbl_login_now".tr,
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
