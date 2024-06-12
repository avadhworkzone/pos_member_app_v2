import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/image_assets.dart';

enum ImageType { network, file, asset }

class AppImageWidget extends StatelessWidget {
  const AppImageWidget({
    Key? key,
    required this.asset,
    this.height,
    this.width,
    this.fit = BoxFit.fitHeight,
    this.allowToViewImage = false,
  }) : super(key: key);

  final String? asset;
  final double? height;
  final double? width;
  final BoxFit fit;
  final bool allowToViewImage;

  @override
  Widget build(BuildContext context) {
    OverlayEntry? _popUpDialog;
    switch (_getImageType(asset ?? "")) {
      case ImageType.network:
        return AbsorbPointer(
          absorbing: !allowToViewImage,
          child: GestureDetector(
            onLongPress: () {
              _popUpDialog =
                  _imagePopUp(url: asset!, imageType: ImageType.network);
              Overlay.of(context).insert(_popUpDialog!);
            },
            onLongPressEnd: (details) => _popUpDialog!.remove(),
            child: CachedNetworkImage(
              imageUrl: asset ?? "",
              height: height,
              width: width,
              fit: fit,
              progressIndicatorBuilder: (context, url, progress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: progress.totalSize != null
                        ? progress.downloaded / progress.totalSize!
                        : 0,
                  ),
                );
              },
              errorWidget: (context, url, error) => Image.asset(
                ImageAssets.imageEmptyBox,
                height: height,
                width: width,
                fit: fit,
              ),
            ),
          ),
        );

      /// Due to web platform, commented the File type
      case ImageType.file:
        return AbsorbPointer(
          absorbing: !allowToViewImage,
          child: GestureDetector(
            onLongPress: () {
              _popUpDialog =
                  _imagePopUp(url: asset!, imageType: ImageType.file);
              Overlay.of(context).insert(_popUpDialog!);
            },
            onLongPressEnd: (details) => _popUpDialog!.remove(),
            child: Image.file(
              File(asset ?? ""),
              fit: fit,
              height: height,
              width: width,
              errorBuilder: (context, url, error) => Image.asset(
                ImageAssets.imageEmptyBox,
                height: height,
                width: width,
                fit: fit,
              ),
            ),
          ),
        );
      case ImageType.asset:
        return AbsorbPointer(
          absorbing: !allowToViewImage,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onLongPress: () {
              _popUpDialog =
                  _imagePopUp(url: asset!, imageType: ImageType.asset);
              Overlay.of(context).insert(_popUpDialog!);
            },
            onLongPressEnd: (details) => _popUpDialog!.remove(),
            child: Image.asset(
              asset ?? "",
              fit: fit,
              height: height,
              width: width,
              errorBuilder: (context, url, error) => Image.asset(
                ImageAssets.imageEmptyBox,
                height: height,
                width: width,
                fit: fit,
              ),
            ),
          ),
        );
    }
  }

  ImageType _getImageType(String imagePath) {
    /// Due to web platform, commented the File type
    if (File(imagePath).existsSync()) return ImageType.file;
    if (Uri.parse(imagePath).isAbsolute) return ImageType.network;
    return ImageType.asset;
  }

  OverlayEntry _imagePopUp(
      {required String url, required ImageType imageType}) {
    return OverlayEntry(
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Dialog(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Container(
                  color: Colors.white,
                  height: Get.width * 0.6,
                  width: Get.width * 0.6,
                  child: imageType == ImageType.network
                      ? CachedNetworkImage(
                          imageUrl: asset ?? "",
                          fit: BoxFit.contain,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Center(
                              child: CircularProgressIndicator(
                                value: progress.totalSize != null
                                    ? progress.downloaded / progress.totalSize!
                                    : 0,
                              ),
                            );
                          },
                          errorWidget: (context, url, error) => Image.asset(
                            ImageAssets.imageEmptyBox,
                            height: height,
                            width: width,
                            fit: BoxFit.contain,
                          ),
                        )
                      : imageType == ImageType.file
                          ? Image.file(
                              File(asset ?? ""),
                              fit: BoxFit.contain,
                              errorBuilder: (context, url, error) =>
                                  Image.asset(
                                ImageAssets.imageEmptyBox,
                                height: height,
                                width: width,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Image.asset(
                              asset ?? "",
                              fit: BoxFit.contain,
                              errorBuilder: (context, url, error) =>
                                  Image.asset(
                                ImageAssets.imageEmptyBox,
                                height: height,
                                width: width,
                                fit: BoxFit.contain,
                              ),
                            ),
                ),
              ),
            ));
  }
}

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen({Key? key, required this.asset}) : super(key: key);
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppImageWidget(
          asset: asset,
        ),
      ),
    );
  }
}
