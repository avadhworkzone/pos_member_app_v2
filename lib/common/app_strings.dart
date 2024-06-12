import 'package:get/get.dart';
import 'package:member_app_v2/common/localization/app_localization.dart';

class AppStrings {
  static String get appName => TranslationKeys.appName.toString().tr;
  static String get noTransactionFound =>
      TranslationKeys.noTransactionFound.toString().tr;
  static String get noVoucherFound =>
      TranslationKeys.noVoucherFound.toString().tr;
  static String get pullUpLoad => TranslationKeys.pullUpLoad.toString().tr;
  static String get somethingWentWrong =>
      TranslationKeys.somethingWentWrong.toString().tr;
  static String get clickToRetry => TranslationKeys.clickToRetry.toString().tr;
  static String get noMoreData => TranslationKeys.noMoreData.toString().tr;
  static String get skipIntro => TranslationKeys.skipIntro.toString().tr;
  static String get createAccount =>
      TranslationKeys.createAccount.toString().tr;
  static String get signInInsted => TranslationKeys.signInInsted.toString().tr;
  static String get introTitle1 => TranslationKeys.introTitle1.toString().tr;
  static String get introSubtitle1 =>
      TranslationKeys.introSubtitle1.toString().tr;
  static String get introTitle2 => TranslationKeys.introTitle2.toString().tr;
  static String get introSubtitle2 =>
      TranslationKeys.introSubtitle2.toString().tr;
  static String get introTitle3 => TranslationKeys.introTitle3.toString().tr;
  static String get introSubtitle3 =>
      TranslationKeys.introSubtitle3.toString().tr;
  static String get thankYou => TranslationKeys.thankYou.toString().tr;
  static String get verificationSuccessMessage =>
      TranslationKeys.verificationSuccessMessage.toString().tr;
  static String get noInternetConnection =>
      TranslationKeys.noInternetConnection.toString().tr;

  static String get name => TranslationKeys.name.toString().tr;
  static String get phoneNo => TranslationKeys.phoneNo.toString().tr;
  static String get email => TranslationKeys.email.toString().tr;
  static String get dateOfBirth => TranslationKeys.dateOfBirth.toString().tr;
  static String get password => TranslationKeys.password.toString().tr;
  static String get sendOtpCode => TranslationKeys.sendOtpCode.toString().tr;
  static String get iAcceptThe => TranslationKeys.iAcceptThe.toString().tr;
  static String get termCondition =>
      TranslationKeys.termCondition.toString().tr;
  static String get and => TranslationKeys.and.toString().tr;
  static String get pdpNotice => TranslationKeys.pdpNotice.toString().tr;
  static String get recieveUpdate =>
      TranslationKeys.recieveUpdate.toString().tr;
  static String get contactUs => TranslationKeys.contactUs.toString().tr;
  static String get anytime => TranslationKeys.anytime.toString().tr;
  static String get otpVerification =>
      TranslationKeys.otpVerification.toString().tr;
  static String get enterVerificationCodeHere =>
      TranslationKeys.enterVerificationCodeHere.toString().tr;
  static String get verifyNow => TranslationKeys.verifyNow.toString().tr;
  static String get resendCode => TranslationKeys.resendCode.toString().tr;
  static String get enterValidPhoneNumberOtp =>
      TranslationKeys.enterValidPhoneNumberOtp.toString().tr;
  static String get unableToProcessRequest =>
      TranslationKeys.unableToProcessRequest.toString().tr;
  static String get pleaseVerifyPhoneNumber =>
      TranslationKeys.pleaseVerifyPhoneNumber.toString().tr;
  static String get tabHome => TranslationKeys.tabHome.toString().tr;
  static String get tabCategories =>
      TranslationKeys.tabCategories.toString().tr;
  static String get tabMembership =>
      TranslationKeys.tabMembership.toString().tr;
  static String get tabProfile => TranslationKeys.tabProfile.toString().tr;
  static String get login => TranslationKeys.login.toString().tr;
  static String get forgotYourPassword =>
      TranslationKeys.forgotYourPassword.toString().tr;
  static String get signIn => TranslationKeys.signIn.toString().tr;
  static String get emailOrPhone => TranslationKeys.emailOrPhone.toString().tr;
  static String get enterValidEmailPhone =>
      TranslationKeys.enterValidEmailPhone.toString().tr;
  static String get enterValidPassword =>
      TranslationKeys.enterValidPassword.toString().tr;
  static String get promotionCaption =>
      TranslationKeys.promotionCaption.toString().tr;
  static String get promotionSubtitle =>
      TranslationKeys.promotionSubtitle.toString().tr;
  static String get searchByKeyword =>
      TranslationKeys.searchByKeyword.toString().tr;
  static String get sortBy => TranslationKeys.sortBy.toString().tr;
  static String get filter => TranslationKeys.filter.toString().tr;
  static String items(int count) {
    return TranslationKeys.items
        .toString()
        .trParams({"count": count.toString()});
  }

  static String get addToBag => TranslationKeys.addToBag.toString().tr;
  static String get itemAdded => TranslationKeys.itemAdded.toString().tr;
  static String get reset => TranslationKeys.reset.toString().tr;
  static String get price => TranslationKeys.price.toString().tr;
  static String get from => TranslationKeys.from.toString().tr;
  static String get to => TranslationKeys.to.toString().tr;
  static String get size => TranslationKeys.size.toString().tr;
  static String get color => TranslationKeys.color.toString().tr;
  static String get viewMoreOptions =>
      TranslationKeys.viewMoreOptions.toString().tr;
  static String get applyFilter => TranslationKeys.applyFilter.toString().tr;
  static String selected(int count) {
    return TranslationKeys.selected
        .toString()
        .trParams({"count": count.toString()});
  }

  static String noResultFor(String category) {
    return TranslationKeys.noResultFor
        .toString()
        .trParams({"category": category});
  }

  static String get refNo => TranslationKeys.refNo.toString().tr;
  static String get otherOptions => TranslationKeys.otherOptions.toString().tr;
  static String get quantity => TranslationKeys.quantity.toString().tr;
  static String get productDescription =>
      TranslationKeys.productDescription.toString().tr;
  static String get returnExchange =>
      TranslationKeys.returnExchange.toString().tr;
  static String get shippingDelivery =>
      TranslationKeys.shippingDelivery.toString().tr;
  static String get youMightLike => TranslationKeys.youMightLike.toString().tr;
  static String get loyaltyPoints =>
      TranslationKeys.loyaltyPoints.toString().tr;
  static String get membershipCard =>
      TranslationKeys.membershipCard.toString().tr;
  static String get addToAppleWallet =>
      TranslationKeys.addToAppleWallet.toString().tr;
  static String get membershipManagement =>
      TranslationKeys.membershipManagement.toString().tr;
  static String get claimRewards => TranslationKeys.claimRewards.toString().tr;
  static String get myVouchers => TranslationKeys.myVouchers.toString().tr;
  static String get viewTransactions =>
      TranslationKeys.viewTransactions.toString().tr;
  static String get myWishlist => TranslationKeys.myWishlist.toString().tr;
  static String get recentlyViewd =>
      TranslationKeys.recentlyViewd.toString().tr;
  static String get storeLocator => TranslationKeys.storeLocator.toString().tr;
  static String get contactUsKiv => TranslationKeys.contactUsKiv.toString().tr;
  static String get settings => TranslationKeys.settings.toString().tr;
  static String get termOfUse => TranslationKeys.termOfUse.toString().tr;
  static String get privacyPolicy =>
      TranslationKeys.privacyPolicy.toString().tr;
  static String get support => TranslationKeys.support.toString().tr;
  static String get profileManagement =>
      TranslationKeys.profileManagement.toString().tr;
  static String get shopNow => TranslationKeys.shopNow.toString().tr;
  static String get newRelease => TranslationKeys.newRelease.toString().tr;
  static String get discoverNewProduct =>
      TranslationKeys.discoverNewProduct.toString().tr;
  static String get bestSelling => TranslationKeys.bestSelling.toString().tr;
  static String get wontMissOffer =>
      TranslationKeys.wontMissOffer.toString().tr;
  static String get readyToWear => TranslationKeys.readyToWear.toString().tr;
  static String get ourCuratedProduct =>
      TranslationKeys.ourCuratedProduct.toString().tr;
  static String get history => TranslationKeys.history.toString().tr;
  static String get searchHistory =>
      TranslationKeys.searchHistory.toString().tr;
  static String get brand => TranslationKeys.brand.toString().tr;
  static String get categories => TranslationKeys.categories.toString().tr;
  static String get clearAll => TranslationKeys.clearAll.toString().tr;
  static String get clearAllRetry =>
      TranslationKeys.clearAllRetry.toString().tr;
  static String get calculatedAtCheckout =>
      TranslationKeys.calculatedAtCheckout.toString().tr;
  static String get shipping => TranslationKeys.shipping.toString().tr;
  static String get welcomeTo => TranslationKeys.welcomeTo.toString().tr;
  static String get family => TranslationKeys.family.toString().tr;
  static String get useCode => TranslationKeys.useCode.toString().tr;
  static String get userProfile => TranslationKeys.userProfile.toString().tr;
  static String get accountManagement =>
      TranslationKeys.accountManagement.toString().tr;
  static String get payment => TranslationKeys.payment.toString().tr;
  static String get editProfile => TranslationKeys.editProfile.toString().tr;
  static String get accountSettings =>
      TranslationKeys.accountSettings.toString().tr;
  static String get accountSettingsTitle =>
      TranslationKeys.accountSettingsTitle.toString().tr;
  static String get changePassword =>
      TranslationKeys.changePassword.toString().tr;
  static String get changePasswordTitle =>
      TranslationKeys.changePasswordTitle.toString().tr;
  static String get paymentMethod =>
      TranslationKeys.paymentMethod.toString().tr;
  static String get choosePaymentMethod =>
      TranslationKeys.choosePaymentMethod.toString().tr;
  static String get processingPayment =>
      TranslationKeys.processingPayment.toString().tr;
  static String get paymentSuccessful =>
      TranslationKeys.paymentSuccessful.toString().tr;
  static String get thankYouForShoppingWithUs =>
      TranslationKeys.thankYouForShoppingWithUs.toString().tr;
  static String get paymentFailed =>
      TranslationKeys.paymentFailed.toString().tr;
  static String get wouldYouLikeToTryAgain =>
      TranslationKeys.wouldYouLikeToTryAgain.toString().tr;
  static String get changeAddress =>
      TranslationKeys.changeAddress.toString().tr;
  static String get editAddress => TranslationKeys.editAddress.toString().tr;
  static String get addAddress => TranslationKeys.addAddress.toString().tr;
  static String get saveInformation =>
      TranslationKeys.saveInformation.toString().tr;
  static String get backToHomepage =>
      TranslationKeys.backToHomepage.toString().tr;
  static String get makeDefaultAddress =>
      TranslationKeys.makeDefaultAddress.toString().tr;
  static String get addNewAddress =>
      TranslationKeys.addNewAddress.toString().tr;
  static String get onlineBanking =>
      TranslationKeys.onlineBanking.toString().tr;
  static String get creditDebitCard =>
      TranslationKeys.creditDebitCard.toString().tr;
  static String get payLaterByGrab =>
      TranslationKeys.payLaterByGrab.toString().tr;
  static String get shopBack => TranslationKeys.shopBack.toString().tr;
  static String get loginSuccessMessage =>
      TranslationKeys.loginSuccessMessage.toString().tr;
  static String get alreadyHaveAccount =>
      TranslationKeys.alreadyHaveAccount.toString().tr;
  static String get notHaveAccount =>
      TranslationKeys.notHaveAccount.toString().tr;
  static String cart(int count) =>
      TranslationKeys.cart.toString().trParams({"count": count.toString()});
  static String checkoutItems(int count) => TranslationKeys.checkoutItems
      .toString()
      .trParams({"count": count.toString()});
  static String get checkout => TranslationKeys.checkout.toString().tr;
  static String get products => TranslationKeys.products.toString().tr;
  static String get shippingDetails =>
      TranslationKeys.shippingDetails.toString().tr;
  static String get deliveryAddress =>
      TranslationKeys.deliveryAddress.toString().tr;
  static String get shippingOptions =>
      TranslationKeys.shippingOptions.toString().tr;
  static String get standardDelivery =>
      TranslationKeys.standardDelivery.toString().tr;
  static String get vouchers => TranslationKeys.vouchers.toString().tr;
  static String get noVouchersSelected =>
      TranslationKeys.noVouchersSelected.toString().tr;
  static String get total => TranslationKeys.total.toString().tr;
  static String get proceedToPayment =>
      TranslationKeys.proceedToPayment.toString().tr;
  static String get receivedBy => TranslationKeys.receivedBy.toString().tr;
  static String get cartEmptyMessage =>
      TranslationKeys.cartEmptyMessage.toString().tr;
  static String get chooseShippingOptions =>
      TranslationKeys.chooseShippingOptions.toString().tr;
  static String get instantDelivery =>
      TranslationKeys.instantDelivery.toString().tr;
  static String get cartTitle => TranslationKeys.cartTitle.toString().tr;
  static String get logout => TranslationKeys.logout.toString().tr;
  static String get logoutConfirmMessage =>
      TranslationKeys.logoutConfirmMessage.toString().tr;
  static String get selectSizeAndColor =>
      TranslationKeys.selectSizeAndColor.toString().tr;
  static String get browseFullCollection =>
      TranslationKeys.browseFullCollection.toString().tr;
  static String get itemAddedToCart =>
      TranslationKeys.itemAddedToCart.toString().tr;
  static String get itemAddedToWishlist =>
      TranslationKeys.itemAddedToWishlist.toString().tr;
  static String get itemRemoveFromWishlist =>
      TranslationKeys.itemRemoveFromWishlist.toString().tr;
  static String get subtotal => TranslationKeys.subtotal.toString().tr;
  static String get discountAmount =>
      TranslationKeys.discountAmount.toString().tr;
  static String tax(String percent) =>
      TranslationKeys.tax.toString().trParams({"percent": percent});
  static String get noAddressSelected =>
      TranslationKeys.noAddressSelected.toString().tr;
  static String get noShippingMethodSelected =>
      TranslationKeys.noShippingMethodSelected.toString().tr;
  static String get noPaymentMethodSelected =>
      TranslationKeys.noPaymentMethodSelected.toString().tr;
  static String get orders => TranslationKeys.orders.toString().tr;
  static String get orderDate => TranslationKeys.orderDate.toString().tr;
  static String get orderNumber => TranslationKeys.orderNumber.toString().tr;
  static String get status => TranslationKeys.status.toString().tr;
  static String get trackingId => TranslationKeys.trackingId.toString().tr;
  static String get totalPrice => TranslationKeys.totalPrice.toString().tr;
}
