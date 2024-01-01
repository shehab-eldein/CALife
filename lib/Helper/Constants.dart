import 'dart:convert';

import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<RefreshIndicatorState> homeViewKey =
      GlobalKey<RefreshIndicatorState>();
  static bool isHomeEmpty = true;
  static const baseURL =
      "https://tender-chandrasekhar.38-100-170-33.plesk.page/";
  static const user = "User/";
  static const group = "Group/";
  static const topic = "Topic/";

  static String getMessages(int adID, int userID, int otherUserID) {
    return "https://keen-clarke.38-100-170-33.plesk.page/AdMessage/GetAdMessagesDetailsByAdId?adId=${adID}&userId=${userID}&otherUserId=${otherUserID}";
  }

  static PersistentTabController controller =
      PersistentTabController(initialIndex: 0);
}

class appDesign {
  static const colorPrimary = Color(0xff030F2E);
  static const colorPrimaryDark = Color(0xff0A4D68);
  static const colorPrimaryLight = Color(0xff04BFDB);
  static const colorAccent = Color(0xff04BFDB);
  static const colorAccentDarker = Color(0xFF088395);
  static const colorUnhighlighted = Color(0xff818796);
  static const backGround = Color(0xffffffff);
  static const greyBackground = Color(0xffF5F5F5);
  static const red = Color(0xFFD60000);
}

class UserData extends ChangeNotifier {
  static String language = 'ar';
  static String userNumber = "";
  static String userName = "";
  static String deviceToken = "";
  static bool isInCanada = true;
  static bool showNotifications = true;
  static bool firstRun = true;
  // static int userId = 0;
  // static int userType = 0;

  String get userLanguage => language;
  setLanguage(value) {
    language = value;
    saveLanguage();
    notifyListeners();
  }

  saveLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
    prefs.setBool('isInCanada', isInCanada);
  }

  static User _userInfo = User(
    id: 0,
    displayName: "",
    fullName: "",
    email: "",
    password: "",
    phone: "",
    userImage: "",
    userType: 0,
  );

  User get userInfo => _userInfo;
  bool get isFirstRun => firstRun;

  int getId() {
    return _userInfo.id;
  }

  loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    var emptyUser = User(
      id: 0,
      displayName: "",
      fullName: "",
      email: "",
      password: "",
      phone: "",
      userImage: "",
      userType: 0,
    );

    if (prefs.getString('userInfo') != null) {
      _userInfo = User.fromJson(json.decode(prefs.getString('userInfo')!));
    } else {
      _userInfo = emptyUser;
    }

    language = prefs.getString('language') ?? "ar";
    firstRun = prefs.getBool('firstRun') ?? true;
    isInCanada = prefs.getBool('isInCanada') ?? true;
    showNotifications = prefs.getBool('showNotifications') ?? true;
    notifyListeners();
    print('Loaded user ID: ${_userInfo.id}');
  }

  void saveUserData(user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userInfo', jsonEncode(user.toJson()));
    if (firstRun == true) {
      updateFirstRun();
    }
  }

  void updateFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstRun', false);
  }

  bool isLoggedIn() {
    bool isLoggedIn = _userInfo.id == 0 ? false : true;
    return isLoggedIn;
  }

  logUser(User? user) {
    print("Logged User: ${user!.toJson().toString()}");
    _userInfo = user;
    saveUserData(user);
    notifyListeners();
  }

  signOut() {
    print("Logged out!");
    User clearUser = User(
      id: 0,
      displayName: "",
      fullName: "",
      email: "",
      password: "",
      phone: "",
      userImage: "",
      userType: 0,
    );
    _userInfo = clearUser;
    saveUserData(clearUser);
    notifyListeners();
  }
}
