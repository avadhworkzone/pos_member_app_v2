import 'package:flutter/material.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';

/// Button -> rectangle rounded corner
rectangleRoundedCornerButton({
  @required ValueChanged<String>? appbarActionInterface,
  @required String? sButtonTitle,
  double dButtonWidth = 0.0,
  Color cButtonTextColor = ColorConstants.kPrimaryColor,
  Color cButtonBackGroundColor = ColorConstants.cWhite,
  Color cButtonBorderColor = Colors.transparent,
  double dButtonTextSize = 0.0,
  double dButtonRadius = 0.0,
}) {
  dButtonTextSize =
  dButtonTextSize == 0.0 ? SizeConstants.s_16 : dButtonTextSize;
  dButtonWidth = dButtonWidth == 0.0 ? SizeConstants.width * 0.4 : dButtonWidth;
  dButtonRadius = dButtonRadius == 0.0 ? SizeConstants.s_14 : dButtonRadius;
  return GestureDetector(
    onTap: () {
      appbarActionInterface!(sButtonTitle);
    },
    child: Container(
      alignment: Alignment.center,
      width: dButtonWidth,
      padding: EdgeInsets.only(
        top: SizeConstants.s_12,
        bottom: SizeConstants.s_12,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        color: cButtonBackGroundColor,
        //borderRadius: BorderRadius.all(Radius.circular(dButtonRadius)),
        border: Border.all(
            color: cButtonBorderColor, width: SizeConstants.width * 0.023 / 8),
      ),
      child: Text(
        sButtonTitle!,
        style: getTextSemiBold(colors: cButtonTextColor, size: dButtonTextSize),
      ),
    ),
  );
}

mediumRoundedCornerButton({
  @required ValueChanged<String>? appbarActionInterface,
  @required String? sButtonTitle,
  double dButtonWidth = 0.0,
  Color cButtonTextColor = ColorConstants.kPrimaryColor,
  Color cButtonBackGroundColor = ColorConstants.cWhite,
  Color cButtonBorderColor = Colors.transparent,
  bool cBoxShadow = false,
  double dButtonTextSize = 0.0,
  double dButtonRadius = 0.0,
}) {
  dButtonTextSize =
  dButtonTextSize == 0.0 ? SizeConstants.s_16 : dButtonTextSize;
  dButtonWidth = dButtonWidth == 0.0 ? SizeConstants.width * 0.4 : dButtonWidth;
  dButtonRadius =
  dButtonRadius == 0.0 ? SizeConstants.width * 0.023 : dButtonRadius;
  return GestureDetector(
    onTap: () {
      appbarActionInterface!(sButtonTitle);
    },
    child: Container(
      alignment: Alignment.center,
      width: dButtonWidth,
      padding: EdgeInsets.only(
        top: SizeConstants.s_10,
        bottom: SizeConstants.s_10,
      ),
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: cBoxShadow?Colors.transparent:Colors.grey.withOpacity(0.3),
        //     spreadRadius: 1,
        //     blurRadius: 3,
        //     offset: const Offset(0, 1), // changes position of shadow
        //   ),
        // ],
        color: cButtonBackGroundColor,
        //borderRadius: BorderRadius.all(Radius.circular(dButtonRadius)),
        border: Border.all(
            color: cButtonBorderColor, width: SizeConstants.width * 0.023 / 8),
      ),
      child: Text(
        sButtonTitle!,
        style: getTextMedium(colors: cButtonTextColor, size: dButtonTextSize),
      ),
    ),
  );
}

Widget rectangleButton({
  @required Function? onTap,
  @required String? sButtonTitle,
  double dButtonWidth = 0.0,
  double dHeight = 0.0,
  Color cButtonTextColor = Colors.white,
  Color cButtonBackGroundColor = ColorConstants.kPrimaryColor,
  Color cButtonBorderColor = Colors.transparent,
  double dButtonTextSize = 16.0,
  double dButtonRadius = 0.0,
}) {
  dHeight = (dHeight == 0.0) ? SizeConstants.s1 * 55 : dHeight;
  return GestureDetector(
    onTap: () {
      onTap?.call();
    },
    child: Container(
      alignment: Alignment.center,
      width: dButtonWidth,
      height:dHeight,
      padding: EdgeInsets.only(
        top: SizeConstants.s_12,
        bottom: SizeConstants.s_12,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        color: cButtonBackGroundColor,
        border: Border.all(
            color: cButtonBorderColor, width: SizeConstants.width * 0.023 / 8),
      ),
      child: Text(
        sButtonTitle!,
        style: getTextBold(colors: cButtonTextColor, size: dButtonTextSize),
      ),
    ),
  );
}

textButton({
  @required ValueChanged<String>? appbarActionInterface,
  @required String? sButtonTitle,
  Color cButtonTextColor = ColorConstants.kPrimaryColor,
  double dButtonTextSize = 0.0,
}) {
  dButtonTextSize =
  dButtonTextSize == 0.0 ? SizeConstants.s_16 : dButtonTextSize;

  return GestureDetector(
    onTap: () {
      appbarActionInterface!(sButtonTitle);
    },
    child: Container(
      padding: EdgeInsets.only(
        top: SizeConstants.s_10,
        bottom: SizeConstants.s_10,
      ),
      child: Text(
        sButtonTitle!,
        style: getTextMedium(colors: cButtonTextColor, size: dButtonTextSize),
      ),
    ),
  );
}
