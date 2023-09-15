import 'package:dilkara/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll8:
        return getPadding(
          all: 8,
        );
      default:
        return getPadding(
          all: 14,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.Stroke:
        return ColorConstant.gray200;
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillGray300:
        return ColorConstant.gray300;
      case ButtonVariant.OutlineIndigoA200:
        return null;
      default:
        return ColorConstant.indigoA200;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineIndigoA200:
        return BorderSide(
          color: ColorConstant.indigoA200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.Stroke:
      case ButtonVariant.FillIndigoA200:
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillGray300:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.LatoRegular13Gray90001:
        return TextStyle(
          color: ColorConstant.gray90001,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.23,
          ),
        );
      case ButtonFontStyle.LatoMedium16WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.25,
          ),
        );
      case ButtonFontStyle.LatoRegular13:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          height: getVerticalSize(
            1.23,
          ),
        );
      case ButtonFontStyle.LatoSemiBold13IndigoA200:
        return TextStyle(
          color: ColorConstant.indigoA200,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.23,
          ),
        );
      case ButtonFontStyle.LatoMedium13WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w500,
          height: getVerticalSize(
            1.23,
          ),
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
          height: getVerticalSize(
            1.23,
          ),
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder8,
}

enum ButtonPadding {
  PaddingAll8,
  PaddingAll15,
}

enum ButtonVariant {
  Stroke,
  FillIndigoA200,
  FillWhiteA700,
  OutlineIndigoA200,
  FillGray300,
}

enum ButtonFontStyle {
  LatoRegular13Gray90001,
  LatoMedium16WhiteA700,
  LatoRegular13,
  LatoSemiBold13IndigoA200,
  LatoMedium13WhiteA700,
  LatoSemiBold13WhiteA700_1,
}
