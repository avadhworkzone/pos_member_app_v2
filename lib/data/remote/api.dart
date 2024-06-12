import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:member_app_v2/data/model/common_response_model.dart';
import 'package:member_app_v2/data/remote/api_util.dart';
import 'package:member_app_v2/data/shared_prefs/shared_prefs.dart';
import 'package:member_app_v2/data/remote/web_constants.dart';
import 'package:member_app_v2/modules/cart/model/cart_summary_response_model.dart';
import 'package:member_app_v2/modules/create_account/model/login_mobile_number_screen_request.dart';
import 'package:member_app_v2/modules/create_account/model/login_mobile_number_screen_response.dart';
import 'package:member_app_v2/modules/home/home_tab/model/banner_response.dart';
import 'package:member_app_v2/modules/home/home_tab/model/categories_response.dart';
import 'package:member_app_v2/modules/home/home_tab/model/items_response.dart';
import 'package:member_app_v2/modules/home/profile/model/get_members_details_response.dart';
import 'package:member_app_v2/modules/home/user_profile/edit_profile/model/profile_delete_response.dart';
import 'package:member_app_v2/modules/login/model/login_mobile_number_otp_screen_request.dart';
import 'package:member_app_v2/modules/login/model/login_mobile_number_otp_screen_response.dart';
import 'package:member_app_v2/modules/order/model/order_response_model.dart';
import 'package:member_app_v2/modules/product_detail/model/item_response.dart';
import 'package:member_app_v2/modules/search_result/model/brands_response.dart';
import 'package:member_app_v2/modules/search_result/model/colors_response.dart';
import 'package:member_app_v2/modules/search_result/model/sizes_response.dart';
import 'package:member_app_v2/modules/wishlist/model/wishlist_response_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../modules/home/membership/model/get_voucher_response.dart';
import '../../modules/home/membership/model/transaction_list_response.dart';

enum EnumDioMethod {
  get,
  put,
  post,
  delete,
}

class Api {
  Api._();

  static Future<Dio> _getDio(EnumDioMethod enumDioMethod) async {
    Dio dio = Dio();

    //dio.options.baseUrl = WebConstants.baseURL;
    dio.options.method = enumDioMethod.toString().split(".").last;
    dio.options.headers["authorization"] = "Bearer ${SharedPrefs.getUserToken}";
    dio.options.headers['Accept'] = 'application/json';
    dio.options.contentType = Headers.jsonContentType;

    if (!kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
      };
    }

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }

  static Future<LoginMobileNumberScreenResponse> sendOtp(
      LoginMobileNumberScreenRequest request) async {
    try {
      Response response = await _getDio(EnumDioMethod.post).then((dio) {
        return dio.post(WebConstants.actionLoginMobileNumberScreen,
            data: request.toJson());
      });
      debugPrint("Response SendOtp : ${response.data}");
      return LoginMobileNumberScreenResponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<LoginMobileNumberOtpScreenResponse> verifyOtp(
      LoginMobileNumberOtpScreenRequest request) async {
    try {
      Response response = await _getDio(EnumDioMethod.post).then((dio) {
        return dio.post(WebConstants.actionLoginMobileNumberOtpScreen,
            data: request.toJson());
      });
      debugPrint("Response VerifyOtp : ${response.data}");
      return LoginMobileNumberOtpScreenResponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<GetMemberDetailsResponse> getMemberDetail() async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.actionGetMembersDetails);
      });
      debugPrint("Response member : ${response.data}");
      return GetMemberDetailsResponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BannersReponse> getBanners(
      {int? pageNo, int? sizePerPage, bool? isActive, String? position}) async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.banners(
            pageNo: pageNo,
            sizePerPage: sizePerPage,
            isActive: isActive,
            position: position));
      });
      debugPrint("Response Banner : ${response.data}");
      return BannersReponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CategoriesReponse> getCategories(
      {int? pageNo,
      bool? onlyTopMenu,
      bool? onlyWithItems,
      int? pageSize,
      int? parentId,
      bool? onlyActive,
      String? sortBy}) async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.categories(
            pageNo: pageNo,
            onlyTopMenu: onlyTopMenu,
            onlyWithItems: onlyWithItems,
            pageSize: pageSize,
            parentId: parentId,
            onlyActive: onlyActive,
            sortBy: sortBy));
      });
      debugPrint("Response Categories : ${response.data}");
      return CategoriesReponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<ItemsReponse> getItems(
      {int? pageNo,
      bool? newArrivals,
      bool? bestSellers,
      bool? onlyActive,
      int? pageSize,
      String? categoryIds,
      String? brandIds,
      String? colorIds,
      String? sizeIds,
      String? sortby,
      String? search}) async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.getItems(
            pageNo: pageNo,
            onlyActive: onlyActive,
            newArrivals: newArrivals,
            bestSellers: bestSellers,
            pageSize: pageSize,
            brandIds: brandIds ?? "",
            categoryIds: categoryIds ?? "",
            colorIds: colorIds ?? "",
            sizeIds: sizeIds ?? "",
            sortBy: sortby ?? "",
            search: search ?? ""));
      });
      debugPrint("Response Home Items : ${response.data}");
      return ItemsReponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  /// my vouchers screen api call
  static Future<GetVoucherResponseModel> myVoucher(
      {String? perPage,
      int? page,
      String? sortBy,
      String? sortDirection,
      int? status}) async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.myVouchers(
            page: page,
            status: status,
            perPage: perPage,
            sortBy: sortBy,
            sortDirection: sortDirection));
      });
      debugPrint("Response my voucher : ${response.data}");
      return GetVoucherResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      print('dio exception ====>>> ${e}');
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  /// get transaction list
  static Future<TransactionListResponse> getTransaction(
      {String? perPage,
      int? page,
      String? sortBy,
      String? sortDirection}) async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.viewTransaction(
            page: page,
            perPage: perPage,
            sortBy: sortBy,
            sortDirection: sortDirection));
      });
      debugPrint("Response transaction list : ${response.data}");
      return TransactionListResponse.fromJson(response.data);
    } on DioException catch (e) {
      print('dio exception ====>>> ${e}');
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<BrandsReponse> getBrands() async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.brands);
      });
      debugPrint("Response Brands : ${response.data}");
      return BrandsReponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<ColorsReponse> getColors() async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.colors);
      });
      debugPrint("Response Colors : ${response.data}");
      return ColorsReponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<SizesReponse> getSizes() async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.sizes);
      });
      debugPrint("Response Colors : ${response.data}");
      return SizesReponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<ItemReponse> getItem({required int id}) async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.item(id));
      });
      debugPrint("Response Colors : ${response.data}");
      return ItemReponse.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CommonResponseModel> incrementCart(
      {required int itemId, required int itemVariantId}) async {
    try {
      Response response = await _getDio(EnumDioMethod.post).then((dio) {
        return dio.post(WebConstants.incrementCart,
            data: {"itemId": itemId, "itemVariationId": itemVariantId},
            options: Options(headers: {
              "Authorization": "Bearer ${WebConstants.userToken}"
            }));
      });
      debugPrint("Response Increment Cart Item : ${response.data}");
      return CommonResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CommonResponseModel> decrementCart(
      {required int itemId, required int itemVariantId}) async {
    try {
      Response response = await _getDio(EnumDioMethod.post).then((dio) {
        return dio.post(WebConstants.decrementCart,
            data: {"itemId": itemId, "itemVariationId": itemVariantId},
            options: Options(headers: {
              "Authorization": "Bearer ${WebConstants.userToken}"
            }));
      });
      debugPrint("Response Decrement Cart Item : ${response.data}");
      return CommonResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CartSummaryResponseModel> getCartSummary() async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.cartSummary,
            options: Options(headers: {
              "Authorization": "Bearer ${WebConstants.userToken}"
            }));
      });
      debugPrint("Response Cart Summary : ${response.data}");
      return CartSummaryResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CommonResponseModel> addToWishLIst({required int id}) async {
    try {
      Response response = await _getDio(EnumDioMethod.post).then((dio) {
        return dio.post(WebConstants.addWishlist(id),
            options: Options(headers: {
              "Authorization": "Bearer ${WebConstants.userToken}"
            }));
      });
      debugPrint("Response Add wishlist : ${response.data}");
      return CommonResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CommonResponseModel> removeFromWishLIst(
      {required int id}) async {
    try {
      Response response = await _getDio(EnumDioMethod.delete).then((dio) {
        return dio.delete(WebConstants.removeWishlist(id),
            options: Options(headers: {
              "Authorization": "Bearer ${WebConstants.userToken}"
            }));
      });
      debugPrint("Response Remove Wishlist : ${response.data}");
      return CommonResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<WishlistResponseModel> getWishList() async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.wishlist,
            options: Options(headers: {
              "Authorization": "Bearer ${WebConstants.userToken}"
            }));
      });
      debugPrint("Response Wishlist : ${response.data}");
      return WishlistResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<CommonResponseModel> checkWishlistStatus(
      {required int id}) async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(WebConstants.checkWishListStatus(id),
            options: Options(headers: {
              "Authorization": "Bearer ${WebConstants.userToken}"
            }));
      });
      debugPrint("Response Check wishlist status : ${response.data}");
      return CommonResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<OrderResponseModel> getOrders(
      {int? pageNo, int? pageSize, int? userId}) async {
    try {
      Response response = await _getDio(EnumDioMethod.get).then((dio) {
        return dio.get(
            WebConstants.getOrders(
                pageNo: pageNo, pageSize: pageSize, userId: userId),
            options: Options(headers: {
              "Authorization": "Bearer ${WebConstants.userToken}"
            }));
      });
      debugPrint("Response Get Orders : ${response.data}");
      return OrderResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<ProfileDeleteResponse> deleteProfile() async {
    try {
      Response response = await _getDio(EnumDioMethod.post).then((dio) {
        return dio.post(WebConstants.actionDeleteMember);
      });
      debugPrint("Response Check wishlist status : ${response.data}");
      ProfileDeleteResponse dashboardResponse;

      ///
      if (response.statusCode == 200) {
        dashboardResponse = ProfileDeleteResponse(
            message: "Your profile is delete successfully", status: true);
      } else {
        dashboardResponse =
            ProfileDeleteResponse.fromJson(json.decode(response.data));
        dashboardResponse.status = false;
      }

      ///
      return dashboardResponse;
    } on DioException catch (e) {
      ApiUtil.handleApiError(e);
      throw e.response?.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
