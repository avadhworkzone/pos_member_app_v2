import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/app_strings.dart';
import 'package:member_app_v2/common/image_assets.dart';
import 'package:member_app_v2/common/text_styles_constants.dart';

class AppGetXFutureBuilder<T> extends StatelessWidget {
  const AppGetXFutureBuilder({
    Key? key,
    required this.controller,
    required this.builder,
    this.image,
    this.emptyDataTitle,
    this.emptyDataSubtitle,
    this.isErrorInScaffold = false,
    this.isEmptyInScaffold = false,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
  }) : super(key: key);
  final StateMixin<T> controller;
  final Function(T? data) builder;
  final String? image;
  final String? emptyDataTitle;
  final String? emptyDataSubtitle;
  final bool isErrorInScaffold;
  final bool isEmptyInScaffold;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: controller.obx(
        (data) => builder(data),
        onLoading:
            Center(child: loadingWidget ?? const CircularProgressIndicator()),
        onError: (error) => errorWidget != null
            ? errorWidget!
            : isErrorInScaffold
                ? Scaffold(body: Center(child: Text(error ?? "Error occurred")))
                : Center(child: Text(error ?? "Error occurred")),
        onEmpty: Center(
          child: (emptyWidget != null)
              ? emptyWidget
              : isEmptyInScaffold
                  ? Scaffold(
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(image ?? ImageAssets.imageEmptyBox),
                          SizedBox(height: Get.height * 0.015),
                          Text(
                            emptyDataTitle ?? AppStrings.noMoreData,
                            style:
                                getTextBold(size: 24.0, colors: Colors.black),
                          ),
                          if (emptyDataSubtitle != null) ...[
                            const SizedBox(height: 8),
                            Text(
                              emptyDataSubtitle ?? "",
                              style: getTextMedium(colors: Colors.black),
                            ),
                          ]
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(image ?? ImageAssets.imageEmptyBox),
                        SizedBox(height: Get.height * 0.015),
                        Text(
                          emptyDataTitle ?? AppStrings.noMoreData,
                          style: getTextBold(size: 16.0, colors: Colors.black),
                        ),
                        if (emptyDataSubtitle != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            emptyDataSubtitle ?? "",
                            style: getTextMedium(colors: Colors.black),
                          ),
                        ]
                      ],
                    ),
        ),
      ),
    );
  }
}
