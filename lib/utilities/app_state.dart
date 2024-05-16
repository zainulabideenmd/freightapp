import 'package:flutter/cupertino.dart';

import '../main.dart';

class AppState {
  AppState._internal();

  static final AppState instance = AppState._internal();

  factory AppState() => instance;
  static bool _isFirstLogin = true;
  static String
  _userId = '',
      _userType = '',
      _userName = '',
      _userImage = '',
      _baseUrl = '';

  set setIsFirstLogin(bool isFirstLogin) => _isFirstLogin = isFirstLogin;

  set setUserId(String userId) => _userId = userId;

  set setUserName(String userName) => _userName = userName;

  set setUserImage(String userImage) => _userImage = userImage;

  set setBaseUrl(String baseUrl) => _baseUrl = baseUrl;

  set setUserType(String userType) => _userType = userType;

  String get getUserId => _userId;

  bool get getFirstLogin => _isFirstLogin;

  String get getUserName => _userName;

  String get getUserImage => _userImage;

  String get getUserType => _userType;

  String get getBaseUrl => _baseUrl;

  double get getScreenHeight =>
      MediaQuery.of(navigatorKey.currentContext!).size.height;

  double get getScreenWidth =>
      MediaQuery.of(navigatorKey.currentContext!).size.width;
}