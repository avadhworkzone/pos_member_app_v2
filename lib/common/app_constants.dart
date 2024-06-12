class AppConstants {
  /// Release -> true , UAT -> false
  static bool isLiveURLToUse = false;

  /// Staging -> true , UAT -> false
  static bool isLiveURLStaging = false;

  /// Staging
  static bool isStagingURL = false;
  static bool isLiveURLToQa = true;

  /// One place to hide all credentials during production build upload
  static bool isClearLoginCredentials = false;

  /// Shared Preference Encryption -> true , Normal -> false
  static bool isSharedPrefToEncrypt = true;

  /// Enable Crashlytics -> true , Normal -> false
  static bool isCrashlyticsToEnable = true;

  /// Enable Analytics -> true , Normal -> false
  static bool isAnalyticsToEnable = true;

  /// Mobile OS Platform
  static const String platformAndroid = "ANDROID";
  static const String platformIOS = "IOS";
}
