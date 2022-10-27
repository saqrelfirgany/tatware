
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static bool isLoggedIn = false;
  static String termination = '';
  static String userLocale = '';
  static String token = '';
  static String date = '';
  static String income = '';
  static String creditJson = '';

  static String sharedPreferencesUserLoggedInKey = 'IsLoggedIn';
  static String sharedPreferencesUserPasswordInKey = 'UserPassword';
  static String sharedPreferencesUserAvatarInKey = 'UserAvatar';
  static String sharedPreferencesUserTokenInKey = 'UserToken';
  static String sharedPreferencesTermination = 'Termination';
  static String sharedPreferencesUserLocale = 'UserLocale';
  static String sharedPreferencesDate = 'Date';
  static String sharedPreferencesIncome = 'income';
  static String sharedPreferencesCreditJson = 'creditJson';

  ///
  ///Is Logged In
  ///
  static Future<bool> saveUserLoggedInSharedPreferences(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setBool(sharedPreferencesUserLoggedInKey, isLoggedIn);
  }

  static getUserLoggedInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(sharedPreferencesUserLoggedInKey) ?? false;
  }

  ///
  /// User Token
  ///
  static Future<bool> saveUserTokenInSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserTokenInKey, token);
  }

  static getUserTokenInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(sharedPreferencesUserTokenInKey) ?? '';
  }

  ///
  /// User Locale
  ///
  static Future<bool> saveUserLocaleInSharedPreferences(String local) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserLocale, local);
  }

  static getUserLocaleInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(sharedPreferencesUserLocale) ?? '';
  }

  ///
  /// Termination
  ///
  static Future<bool> saveTerminationInSharedPreferences(
    String termination,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesTermination, termination);
  }

  static getTerminationInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(sharedPreferencesTermination) ?? '-1';
  }

  ///
  /// Date
  ///
  static Future<bool> saveDateInSharedPreferences(String termination) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesDate, termination);
  }

  static getDateInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(sharedPreferencesDate) ?? '';
  }

  ///
  /// Net Income
  ///
  static Future<bool> saveIncomeInSharedPreferences(String income) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesIncome, income);
  }

  static getIncomeInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(sharedPreferencesIncome) ?? '';
  }

  ///
  /// Credit Json
  ///
  static Future<bool> saveCreditInSharedPreferences(String credit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesCreditJson, credit);
  }

  static getCreditInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.get(sharedPreferencesCreditJson) ?? '';
  }

}