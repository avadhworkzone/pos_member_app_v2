import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/alert/app_alert.dart';

class ApiUtil {
  static apiCallHandler<T>(Function() apiCallBody,
      {Function(T? data)? onApiCallSuccess,
      Function(String errorMessage)? onApiCallFail}) async {
    Get.log("apiCallHandler called");
    bool res = false;
    String errorMessage = "";
    T? model;
    AppAlert.showProgressDialog(Get.context!);
    try {
      model = await apiCallBody();
      res = true;
    } catch (e) {
      Get.log("apiCallHandler error - $e", isError: true);
      errorMessage = e.toString();
      res = false;
    } finally {
      Get.log("closeDialog");
      AppAlert.closeDialog(Get.context!);
    }
    res
        ? onApiCallSuccess != null
            ? onApiCallSuccess(model)
            : ""
        : onApiCallFail != null
            ? onApiCallFail(errorMessage)
            : "";
  }

  static void handleApiError(DioException? dioError) {
    AppAlert.showSnackBar(
        Get.context!, dioError?.response?.data['message'] ?? "");
  }
}
