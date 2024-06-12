import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_app_v2/common/utils/network_utils.dart';
import '../../../common/alert/app_alert.dart';
import '../../../common/app_strings.dart';
import '../../../data/remote/api.dart';
import 'model/get_voucher_response.dart';
import 'model/transaction_list_response.dart';

class MyVoucherController extends GetxController
    with StateMixin<MemberShipScreenResponse> {
  // MyVoucherControllerherController controllerMobileNumberOtp = OtpFieldController();
  bool isFirstTime = false;

  @override
  void onInit() {
    super.onInit();
    initData();
    tInitData();
  }

  int pageNumber = 0;
  int tPageNumber = 0;

  List<Vouchers> voucherDataList = [];

  List<LoyaltyPoints> transactionList = [];

  ScrollController? scrollController;
  ScrollController? scrollController1;

  clearResponse() {
    voucherDataList.clear();
    print('voucher list is clear -- ${voucherDataList}');
    pageNumber = 0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });
  }

  clearResponseTransaction() {
    transactionList.clear();
    print('transaction list is clear -- ${transactionList}');
    tPageNumber = 0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });
  }

  initData() {
    isFirstTime = true;
    clearResponse();
    initScrolling();
    initMyVoucherScreen();
    update();
    isFirstTime = false;
  }

  tInitData() {
    clearResponseTransaction();
    tInitScrolling();
    initMyVoucherScreen();
    update();
  }

  void _scrollDown() {
    scrollController!.jumpTo(scrollController!.position.maxScrollExtent);
  }

  void _tScrollDown() {
    scrollController1!.jumpTo(scrollController1!.position.maxScrollExtent);
  }

  initScrolling() {
    scrollController = new ScrollController();
    scrollController!.addListener(() async {
      print("Scrolling");

      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        _scrollDown();
        update();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          // isPaginationLoading = true;
          pageNumber = pageNumber + 1;
          initMyVoucherScreen();
        });
      }
    });
  }

  tInitScrolling() {
    scrollController1 = new ScrollController();
    scrollController1!.addListener(() async {
      print("Scrolling1");

      if (scrollController1!.position.maxScrollExtent ==
          scrollController1!.position.pixels) {
        _tScrollDown();
        update();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          // isPaginationLoading = true;
          tPageNumber = tPageNumber + 1;
          initMyVoucherScreen();
        });
      }
    });
  }

  Future<void> initMyVoucherScreen() async {
    await NetworkUtils()
        .checkInternetConnection()
        .then((isInternetAvailable) async {
      if (isInternetAvailable) {
        try {
          GetVoucherResponseModel voucherResponse = await Api.myVoucher(
              sortDirection: 'desc',
              sortBy: 'id',
              perPage: '10',
              status: 0,
              page: pageNumber);

          TransactionListResponse transactionListResponse =
              await Api.getTransaction(
                  page: 1, perPage: '10', sortBy: 'id', sortDirection: 'desc');

          change(
              MemberShipScreenResponse(
                  voucherReponse: voucherResponse,
                  transactionReponse: transactionListResponse),
              status: RxStatus.success());
          // change(transactionListResponse, status: RxStatus.success());
          voucherDataList.addAll(voucherResponse.vouchers ?? []);
          transactionList.addAll(transactionListResponse.loyaltyPoints ?? []);
          log('voucherDataList ==== >>> ${jsonEncode(voucherDataList)}');
          log('vouchers response is ==== >>> ${jsonEncode(voucherResponse)}');

          // ApiUtil.apiCallHandler<GetVoucherResponseModel>(
          //     () => Api.myVoucher(
          //         sortDirection: 'desc',
          //         sortBy: 'id',
          //         perPage: '10',
          //         status: 0,
          //         page: 1),
          //     onApiCallSuccess: (data) {
          //       // SharedPrefs.setUserToken(data?.token);
          //       // Get.offAll(() => const ThankYouScreenWidget());
          //     },
          //     onApiCallFail: (errorMessage) => AppAlert.showSnackBar(
          //         Get.context!, AppStrings.somethingWentWrong));
        } catch (e) {
          AppAlert.showSnackBar(
              Get.context!, AppStrings.unableToProcessRequest);
        }
      } else {
        AppAlert.showSnackBar(Get.context!, AppStrings.noInternetConnection);
      }
    });
  }
}

class MemberShipScreenResponse {
  GetVoucherResponseModel? voucherReponse;
  TransactionListResponse? transactionReponse;

  MemberShipScreenResponse({
    this.voucherReponse,
    this.transactionReponse,
  });
}
