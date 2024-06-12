import 'package:get_storage/get_storage.dart';

import 'pref_constants.dart';

class SharedPrefs {
  static GetStorage appPrefs = GetStorage();

  static String get getUserToken => appPrefs.read(PrefConstants.token) ?? "";
  static String get getMember => appPrefs.read(PrefConstants.member) ?? "";
  static String get uiLanguageCode =>
      appPrefs.read(PrefConstants.uiLanguageCode) ?? "en";
  static bool get isIntroSeen =>
      appPrefs.read(PrefConstants.isIntroSeen) ?? false;

  /// App Token
  static Future<void> setUserToken(String? bearerToken) async {
    await appPrefs.write(PrefConstants.token, bearerToken);
  }

  /// App Token
  static Future<void> setMember(String? member) async {
    await appPrefs.write(PrefConstants.member, member);
  }

  /// App Language
  static Future<void> setUiLanguageCode(String? langCode) async {
    await appPrefs.write(PrefConstants.token, langCode);
  }

  /// IntroSeen
  static Future<void> setIntroSeen() async {
    await appPrefs.write(PrefConstants.isIntroSeen, true);
  }

  ///clear all
  static Future<void> clearSharedPreferences() async {
    await appPrefs.erase();
  }
}
