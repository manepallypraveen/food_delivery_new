import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'pref_keys.dart';

class PrefUtils {
  PrefUtils();

  static setAssetsLimit(String AssetsLimit) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.AssetsLimit, AssetsLimit);
  }

  static Future<String?> getAssetsLimit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.AssetsLimit);
  }

  static setLiabilitiesLimit(String LiabilitiesLimit) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.LiabilitiesLimit, LiabilitiesLimit);
  }

  static Future<String?> getLiabilitiesLimit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.LiabilitiesLimit);
  }

  static setVoltDocumentsLimit(String VoltDocumentsLimit) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        PrefKeys.VoltDocumentsLimit, VoltDocumentsLimit);
  }

  static Future<String?> getVoltDocumentsLimit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.VoltDocumentsLimit);
  }

  static setToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.token, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.token);
  }

  static setCusUniqueId(String CusUniqueId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.CusUniqueId, CusUniqueId);
  }

  static Future<String?> getCusUniqueId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.CusUniqueId);
  }

  static setMobile(String mobile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.mobile, mobile);
  }

  static Future<String?> getMobile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.mobile);
  }

  static setEmail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.email, email);
  }

  static Future<String?> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.email);
  }

  static setState(String state) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.state, state);
  }

  static Future<String?> getState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.state);
  }

  static setEzycoins(String ezycoins) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.ezycoins, ezycoins);
  }

  static Future<String?> getEzycoins() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.ezycoins);
  }

  static setIgstPercentage(String IgstPercentage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.IgstPercentage, IgstPercentage);
  }

  static Future<String?> getIgstPercentage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.IgstPercentage);
  }

  static setCgstPercentage(String CgstPercentage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.CgstPercentage, CgstPercentage);
  }

  static Future<String?> getCgstPercentage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.CgstPercentage);
  }

  static setSgstPercentage(String SgstPercentage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.SgstPercentage, SgstPercentage);
  }

  static Future<String?> getSgstPercentage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.SgstPercentage);
  }

  static setFirstName(String firstName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.firstName, firstName);
  }

  static Future<String?> getFirstName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.firstName);
  }

  static setLastName(String lastName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.lastName, lastName);
  }

  static Future<String?> getLastName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.lastName);
  }

  static setSizeLimit(String limit) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.limit, limit);
  }

  static Future<String?> getSizeLimit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.limit);
  }

  static setSizeLimitUsed(String limitUsed) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.limitUsed, limitUsed);
  }

  static Future<String?> getSizeLimitUsed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.limitUsed);
  }

  static setFirebaseToken(String firebaseToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.firebaseToken, firebaseToken);
  }

  static Future<String?> getFirebaseToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.firebaseToken);
  }

  static setNomineeCount(String nomineeCount) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.nomineeCount, nomineeCount);
  }

  static Future<String?> getNomineeCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.nomineeCount);
  }

  static setIsLoggedIn(bool isLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(PrefKeys.isLoggedIn, isLoggedIn);
  }

  static Future<bool?> getIsLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(PrefKeys.isLoggedIn);
  }

  static setTheme(bool isDarkTheme) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(PrefKeys.darkTheme, isDarkTheme);
  }

  static Future<bool> getIsDarkTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(PrefKeys.darkTheme) ?? false;
  }

  // static setUser(String userData) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.setString(PrefKeys.user, userData);
  // }

  // static Future<LoginUserModel> getUser() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   Map<String, dynamic> user =
  //       jsonDecode(preferences.getString(PrefKeys.user) ?? "{}");
  //   return LoginUserModel.fromJson(user);
  // }

  static setUserGeoCoding(String userLocation) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.userGeoCoding, userLocation);
  }

  static Future<Map<String, dynamic>> getUserGeoCoding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> userLocation =
        jsonDecode(preferences.getString(PrefKeys.userGeoCoding) ?? "{}");
    return userLocation;
  }

  static clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static setCMS(String cmsPages) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.cmsPages, cmsPages);
  }

  static setSecureHashPassword(String hashPassword) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.hashPassword, hashPassword);
  }

  static Future<String?> getSecureHashPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.hashPassword);
  }
}
