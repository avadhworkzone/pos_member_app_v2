import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:member_app_v2/common/color_constants.dart';
import 'package:member_app_v2/common/size_constants.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';

editTextFiled(TextEditingController mTextEditingController,
    {bool readOnly = false,
    bool mandatoryField = false,
    int maxLines = 1,
    String labelText = "",
    String hintText = "",
    IconData mIcons = Icons.add,
    TextInputType mTextInputType = TextInputType.text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RichText(
        text: TextSpan(
          text: labelText,
          style: getTextBold(
            size: SizeConstants.s1 * 12,
            colors: ColorConstants.cPrimaryTextColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: mandatoryField ? "*" : "",
              style: getTextLight(
                  size: SizeConstants.s1 * 14,
                  colors: Colors.red,
                  letterSpacing: 1.0),
            ),
          ],
        ),
      ),
      // Text(
      //   labelText,
      //   style: getTextRegular(
      //       size: SizeConstants.s_14,
      //       colors: ColorConstants.cDividerLightColor,
      //       letterSpacing: 1.0),
      // ),
      SizedBox(
        height: SizeConstants.s5,
      ),
      TextField(
          controller: mTextEditingController,
          maxLines: maxLines,
          readOnly: readOnly,
          keyboardType: mTextInputType,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          textAlignVertical: TextAlignVertical.top,
          style: getTextMedium(
              size: SizeConstants.s_16,
              colors: ColorConstants.cBlack,
              letterSpacing: 0.5),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16.0),
            filled: true,
            fillColor: Colors.transparent,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.cHintText)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.cHintText)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstants.kPrimaryColor)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            alignLabelWithHint: true,
          )),
    ],
  );
}

editTextMobileNumber(TextEditingController mTextEditingController,
    ValueChanged<String> mCallBackInterface,
    {bool readOnly = false,
    int maxLines = 1,
    String labelText = "",
    String hintText = "",
    IconData mIcons = Icons.add,
    TextInputType mTextInputType = TextInputType.text}) {
  return Container(
      margin: EdgeInsets.only(left: SizeConstants.s3, right: SizeConstants.s3),
      padding: EdgeInsets.only(
          left: SizeConstants.s_15,
          right: SizeConstants.s_15,
          top: SizeConstants.s_12,
          bottom: SizeConstants.s_16),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConstants.s1 * 15)),
          color: Colors.white,
          border: Border.all(
            color: ColorConstants.cEditTextBorderLightColor,
            width: SizeConstants.s_05,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: getTextRegular(
                size: SizeConstants.s_14,
                colors: ColorConstants.cDividerLightColor,
                letterSpacing: 1.0),
          ),
          SizedBox(
            height: SizeConstants.s5,
          ),
          TextField(
            controller: mTextEditingController,
            maxLines: maxLines,
            readOnly: readOnly,
            maxLength: 12,
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            textAlignVertical: TextAlignVertical.top,
            style: getTextMedium(
                size: SizeConstants.s_16,
                colors: ColorConstants.cBlack,
                letterSpacing: 0.5),
            autocorrect: false,
            decoration: InputDecoration(
              counter: Offstage(),
              contentPadding: EdgeInsets.all(0.0),
              filled: true,
              fillColor: Colors.transparent,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hintText,
              alignLabelWithHint: true,
              // suffixIcon: Icon(
              //   mIcons,
              //   color: ColorConstants.kPrimaryColor,
              //   size: SizeConstants.s_22,
              // ),
            ),
            onChanged: (text) {
              mCallBackInterface(text);
            },
          ),
        ],
      ));
}

editTextFiledNumber(TextEditingController mTextEditingController,
    ValueChanged<String> mCallBackInterface,
    {bool readOnly = false,
    int maxLines = 1,
    String labelText = "",
    String hintText = "",
    IconData mIcons = Icons.add,
    TextInputType mTextInputType = TextInputType.text}) {
  return Container(
      margin: EdgeInsets.only(left: SizeConstants.s3, right: SizeConstants.s3),
      padding: EdgeInsets.only(
          left: SizeConstants.s_15,
          right: SizeConstants.s_15,
          top: SizeConstants.s_12,
          bottom: SizeConstants.s_16),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(SizeConstants.s1 * 15)),
          color: Colors.white,
          border: Border.all(
            color: ColorConstants.cEditTextBorderLightColor,
            width: SizeConstants.s_05,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: getTextRegular(
                size: SizeConstants.s_14,
                colors: ColorConstants.cDividerLightColor,
                letterSpacing: 1.0),
          ),
          SizedBox(
            height: SizeConstants.s5,
          ),
          TextField(
            controller: mTextEditingController,
            maxLines: maxLines,
            readOnly: readOnly,
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            textAlignVertical: TextAlignVertical.top,
            style: getTextMedium(
                size: SizeConstants.s_16,
                colors: ColorConstants.cBlack,
                letterSpacing: 0.5),
            autocorrect: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              filled: true,
              fillColor: Colors.transparent,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hintText,
              alignLabelWithHint: true,
              // suffixIcon: Icon(
              //   mIcons,
              //   color: ColorConstants.kPrimaryColor,
              //   size: SizeConstants.s_22,
              // ),
            ),
            onChanged: (text) {
              mCallBackInterface(text);
            },
          ),
        ],
      ));
}

editTextFiledClickView(TextEditingController mTextEditingController,
    ValueChanged<String> mCallBackInterface,
    {bool readOnly = false,
    bool mandatoryField = false,
    int maxLines = 1,
    String labelText = "",
    String hintText = "",
    IconData mIcons = Icons.add,
    bool suffixIcon = false,
    TextInputType mTextInputType = TextInputType.text}) {
  return GestureDetector(
    onTap: () {
      mCallBackInterface("click");
    },
    child: Container(
        margin:
            EdgeInsets.only(left: SizeConstants.s3, right: SizeConstants.s3),
        padding: EdgeInsets.only(
            left: SizeConstants.s_15,
            right: SizeConstants.s_15,
            top: SizeConstants.s_12,
            bottom: SizeConstants.s_16),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConstants.s1 * 15)),
            color: Colors.white,
            border: Border.all(
              color: ColorConstants.cEditTextBorderLightColor,
              width: SizeConstants.s_05,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: labelText,
                style: getTextRegular(
                    size: SizeConstants.s1 * 12,
                    colors: ColorConstants.cDividerLightColor,
                    letterSpacing: 0.2),
                children: <TextSpan>[
                  TextSpan(
                    text: mandatoryField ? "*" : "",
                    style: getTextLight(
                        size: SizeConstants.s1 * 14,
                        colors: Colors.red,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
            ),
            // Text(
            //   labelText,
            //   style: getTextRegular(
            //       size: SizeConstants.s_14,
            //       colors: ColorConstants.cDividerLightColor,
            //       letterSpacing: 1.0),
            // ),
            SizedBox(
              height: SizeConstants.s5,
            ),
            TextField(
                onTap: () {
                  mCallBackInterface("click");
                },
                controller: mTextEditingController,
                maxLines: maxLines,
                readOnly: readOnly,
                keyboardType: mTextInputType,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.top,
                style: getTextMedium(
                    size: SizeConstants.s_16,
                    colors: ColorConstants.cBlack,
                    letterSpacing: 0.5),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0.0),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: hintText,
                  alignLabelWithHint: true,
                )),
          ],
        )),
  );
}

editTextFiledGlobalKeyClickView(TextEditingController mTextEditingController,
    GlobalKey mGlobalKey, ValueChanged<String> mCallBackInterface,
    {bool readOnly = false,
    bool mandatoryField = false,
    int maxLines = 1,
    String labelText = "",
    String hintText = "",
    IconData mIcons = Icons.add,
    bool suffixIcon = false,
    TextInputType mTextInputType = TextInputType.text}) {
  return GestureDetector(
      onTap: () {
        mCallBackInterface("click");
      },
      child: Container(
          margin:
              EdgeInsets.only(left: SizeConstants.s3, right: SizeConstants.s3),
          padding: EdgeInsets.only(
              left: SizeConstants.s_15,
              right: SizeConstants.s_15,
              top: SizeConstants.s_12,
              bottom: SizeConstants.s_16),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(SizeConstants.s1 * 15)),
              color: Colors.white,
              border: Border.all(
                color: ColorConstants.cEditTextBorderLightColor,
                width: SizeConstants.s_05,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: labelText,
                  style: getTextRegular(
                      size: SizeConstants.s1 * 12,
                      colors: ColorConstants.cDividerLightColor,
                      letterSpacing: 0.2),
                  children: <TextSpan>[
                    TextSpan(
                      text: mandatoryField ? "*" : "",
                      style: getTextLight(
                          size: SizeConstants.s1 * 14,
                          colors: Colors.red,
                          letterSpacing: 1.0),
                    ),
                  ],
                ),
              ),
              // Text(
              //   labelText,
              //   style: getTextRegular(
              //       size: SizeConstants.s_14,
              //       colors: ColorConstants.cDividerLightColor,
              //       letterSpacing: 1.0),
              // ),
              SizedBox(
                height: SizeConstants.s5,
              ),
              TextField(
                  onTap: () {
                    mCallBackInterface("click");
                  },
                  key: mGlobalKey,
                  controller: mTextEditingController,
                  maxLines: maxLines,
                  readOnly: readOnly,
                  keyboardType: mTextInputType,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  textAlignVertical: TextAlignVertical.top,
                  style: getTextMedium(
                      size: SizeConstants.s_16,
                      colors: ColorConstants.cBlack,
                      letterSpacing: 0.5),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: hintText,
                    alignLabelWithHint: true,
                  )),
            ],
          )));
}

getTextField(TextEditingController mTextEditingController,
    {bool readOnly = false,
    int maxLines = 1,
    String hintText = "",
    TextInputAction textInputAction = TextInputAction.next,
    Widget? suffix,
    TextInputType mTextInputType = TextInputType.text,
    Function(String text)? onSubmitted,
    Function(String text)? onChanged}) {
  return TextField(
      controller: mTextEditingController,
      maxLines: maxLines,
      readOnly: readOnly,
      keyboardType: mTextInputType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: getTextMedium(
          size: SizeConstants.s_16,
          colors: ColorConstants.cBlack,
          letterSpacing: 0.5),
      decoration: InputDecoration(
        suffix: suffix,
        filled: true,
        fillColor: Colors.transparent,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.cHintText)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.cHintText)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.kPrimaryColor)),
        hintText: hintText,
      ));
}
