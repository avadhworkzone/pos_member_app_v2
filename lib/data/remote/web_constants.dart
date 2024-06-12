import 'package:member_app_v2/common/app_constants.dart';

class WebConstants {
  /// Standard Comparison Values
  static int statusCode200 = 200;
  static int statusCode400 = 400;
  static int statusCode422 = 422;

  static String statusMessageOK = "OK";
  static String statusMessageBadRequest = "Bad Request";
  static String statusMessageEntityError = "Unprocessable Entity Error";
  static String statusMessageTokenIsExpired = "Token is Expired";

  static String statusSuccess = "SUCCESS";
  static String statusError = "ERROR";

  /// Web response cases
  static String statusCode200Message =
      "{  \"error\" : true,\n  \"statusCode\" : 200,\n  \"statusMessage\" : \"Success Request\",\n  \"data\" : {\"message\":\" Success \"},\n  \"responseTime\" : 1639548038\n  }";
  static String statusCode401Message =
      "{  \"error\" : true,\n  \"statusCode\" : 401,\n  \"statusMessage\" : \"Unauthenticated\",\n  \"data\" : {\"message\":\"Unauthenticated\"},\n  \"responseTime\" : 1639548038\n  }";
  static String statusCode403Message =
      "{  \"error\" : true,\n  \"statusCode\" : 403,\n  \"statusMessage\" : \"Bad Request\",\n  \"data\" : {\"message\":\"Unauthorized error\"},\n  \"responseTime\" : 1639548038\n  }";
  static String statusCode404Message =
      "{  \"error\" : true,\n  \"statusCode\" : 404,\n  \"statusMessage\" : \"Bad Request\",\n  \"data\" : {\"message\":\"Unable to find the action URL\"},\n  \"responseTime\" : 1639548038\n  }";
  static String statusCode412Message =
      "{  \"error\" : true,\n  \"statusCode\" : 412,\n  \"statusMessage\" : \"Bad Request\",\n  \"data\" : {\"message\":\"Unable to find the action URL\"},\n  \"responseTime\" : 1639548038\n  }";
  static String statusCode422Message =
      "{  \"error\" : true,\n  \"statusCode\" : 412,\n  \"statusMessage\" : \"Bad Request\",\n  \"data\" : {\"message\":\"Unable to find the action URL\"},\n  \"responseTime\" : 1639548038\n  }";
  static String statusCode502Message =
      "{\r\n  \"error\": true,\r\n  \"statusCode\": 502,\r\n  \"statusMessage\": \"Bad Request\",\r\n  \"data\": {\r\n    \"message\": \"Server Error, Please try after sometime\"\r\n  },\r\n  \"responseTime\": 1639548038\r\n}";
  static String statusCode503Message =
      "{  \"error\" : true,\n  \"statusCode\" : 503,\n  \"statusMessage\" : \"Bad Request\",\n  \"data\" : {\"message\":\"Unable to process your request right now, Please try again later\"},\n  \"responseTime\" : 1639548038\n  }";

  /// Control
  static String userToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTIzOTksInJvbGUiOjMsImVtYWlsIjoicGF0ZWx5YXNoOTg1QGdtYWlsLmNvbSIsImlhdCI6MTcwMzU2NzM4NCwiZXhwIjoxNzA2MTU5Mzg0fQ.NS6aNexqr4csLrHqRuwJ0NXRwDv3SAICv-HPceOX6yM";

  /// Base URL
  static String baseUrlPosQa = "https://posqa.freshbits.in/api/member/";
  static String baseUrlLive = "https://retail.ariani.my/api/member/";
  static String baseUrlDev = "https://arianidevpos.freshbits.in/api/member/";
  static String baseUrlStaging = "https://stagingretail.ariani.my/";
  static String baseURL = AppConstants.isStagingURL
      ? baseUrlStaging
      : AppConstants.isLiveURLToQa
          ? baseUrlPosQa
          : AppConstants.isLiveURLToUse
              ? baseUrlLive
              : baseUrlDev;
  static String baseURLPI = "https://pi-apis.artisanscloud.com/";
  static String baseURLRS = "https://report-service.artisanscloud.com/";
  static String baseURLCS = "https://customer-apis.artisanscloud.com/";
  static String baseURLOS = "https://order-apis.artisanscloud.com/";

  ///grant_type:password
  static String baseGrantType = "password";

  ///scope:member_scope
  static String baseScope = "member_scope";

  ///client_id
  static String baseClientIdQa = "99b894d8-37eb-48f0-b94e-39cd91c3adf7";
  static String baseClientIdDev = "99ba5fef-4376-4199-97fa-1ede67a4499c";
  static String baseClientIdLive = "99ba6145-083a-4c0c-bba0-9ff22f22bf14";
  static String baseClientIdStaging = "99b66ae8-5199-44b4-862f-47d090ddfbc8";
  static String baseClientId = AppConstants.isStagingURL
      ? baseClientIdStaging
      : AppConstants.isLiveURLToQa
          ? baseClientIdQa
          : AppConstants.isLiveURLToUse
              ? baseClientIdLive
              : baseClientIdDev;

  ///client_secret
  static String baseClientSecretQa = "AWQfSkw5XHieKeOF6PCECSzZNg2HLyAShxUsJYBh";
  static String baseClientSecretDev =
      "EP2rooQuhsFeDOOCcfOcHyJu94zQw5xPJXlom3t1";
  static String baseClientSecretLive =
      "s0emgR0pU5DaNRfmzNVfwt5VafghsQy4IKgmQ8oN";
  static String baseClientSecretStaging =
      "BMK7SZ476W5sdk6baF6GnZSPHnBHJp1PBF6PIUUN";
  static String baseClientSecret = AppConstants.isStagingURL
      ? baseClientSecretStaging
      : AppConstants.isLiveURLToQa
          ? baseClientSecretQa
          : AppConstants.isLiveURLToUse
              ? baseClientSecretLive
              : baseClientSecretDev;

  /// send otp
  static String actionLoginMobileNumberScreen = "${baseURL}send-otp";

  ///validate-otp
  static String actionLoginMobileNumberOtpScreen =
      "${baseURL}validate-otp-with-client";

  ///get-members-details
  static String actionGetMembersDetails = "${baseURL}member-details";

  static String banners(
      {int? pageNo, int? sizePerPage, bool? isActive, String? position}) {
    return "${baseURLPI}banner?pageNo=$pageNo&sizePerPage=$sizePerPage&isActive=$isActive&position=$position";
  }

  static String categories(
      {int? pageNo,
      bool? onlyTopMenu,
      bool? onlyWithItems,
      int? pageSize,
      int? parentId,
      bool? onlyActive,
      String? sortBy}) {
    if (parentId != null) {
      return "${baseURLPI}category/all?pageNo=$pageNo&pageSize=$pageSize&parentId=$parentId&onlyActive=$onlyActive&sortBy=$sortBy";
    }
    return "${baseURLPI}category?pageNo=$pageNo&onlyTopMenu=$onlyTopMenu&onlyWithItems=$onlyWithItems&pageSize=$pageSize";
  }

  static String getItems(
      {int? pageNo,
      int? pageSize,
      bool? newArrivals,
      bool? bestSellers,
      bool? onlyActive,
      String? categoryIds,
      String? brandIds,
      String? colorIds,
      String? sizeIds,
      String? sortBy,
      String? search}) {
    if (newArrivals != null) {
      return "${baseURLPI}items?pageNo=$pageNo&pageSize=$pageSize&newArrivals=$newArrivals&onlyActive=$onlyActive";
    } else if (bestSellers != null) {
      return "${baseURLPI}items?pageNo=$pageNo&pageSize=$pageSize&bestSellers=$bestSellers&onlyActive=$onlyActive";
    }
    return "${baseURLPI}items?pageNo=$pageNo&pageSize=$pageSize&onlyActive=$onlyActive&colorIds=$colorIds&sizeIds=$sizeIds&categoryIds=$categoryIds&brandIds=$brandIds&sortBy=$sortBy&search=$search";
  }

  static String get brands => "${baseURLPI}brand?pageNo=1&pageSize=10";

  static String get colors => "${baseURLPI}colors?pageNo=1&pageSize=10";

  static String get sizes => "${baseURLPI}size?pageNo=1&pageSize=10";

  static String item(int id) {
    return "${baseURLRS}items/id/$id";
  }

  /// my voucher
  static String myVouchers(
      {String? perPage,
      int? page,
      String? sortBy,
      String? sortDirection,
      int? status}) {
    return "https://posqa.freshbits.in/api/member/member/vouchers?per_page=$perPage&page=$page&sort_by=$sortBy&sort_direction=$sortDirection&status=$status";
  }

  /// transaction
  static String viewTransaction(
      {String? perPage, int? page, String? sortBy, String? sortDirection}) {
    return "https://posqa.freshbits.in/api/member/transactions-list?per_page=$perPage&page=$page&sort_by=$sortBy&sort_direction=$sortDirection";
  }

  static String get incrementCart => "${baseURLCS}cart/increment";
  static String get decrementCart => "${baseURLCS}cart/decrement";
  static String get cartSummary => "${baseURLCS}cart/summary";
  static String get wishlist => "${baseURLCS}wishlist";
  static String addWishlist(int id) => "${baseURLCS}wishlist?itemId=$id";
  static String removeWishlist(int id) =>
      "${baseURLCS}wishlist?itemId=$id&clearAll=false";
  static String checkWishListStatus(int id) =>
      "${baseURLCS}wishlist/check-if-item-exists?itemId=$id";
  static String getOrders({int? pageNo, int? pageSize, int? userId}) {
    return "${baseURLOS}orders?pageNo=$pageNo&pageSize=$pageSize&role=USER&UserId=$userId";
  }

  ///delete-member
  static String actionDeleteMember = "${baseURL}delete-member";
}
