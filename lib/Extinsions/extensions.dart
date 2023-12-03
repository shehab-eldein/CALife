import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension NavigationExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;

  double get screenWidth => screenSize.width;

  // Navigation
  void navigateTo(Widget screen) {
    Navigator.push(
      this,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.easeInCirc;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void routeTo(String name) {
    Navigator.of(this).pushNamed(name);
  }

  //Alerts
  void okAlert({String title = '', String message = '', Function? onDismiss}) {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.white,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade200),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)))),
              child: Text(
                AppLocalizations.of(context)!.dialogOk,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: appDesign.colorAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (onDismiss != null) {
                  onDismiss();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> actionAlert({
    String title = '',
    String message = '',
    required VoidCallback onOkPressed,
  }) async {
    await showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.grey.shade200,
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              child: Text(
                // AppLocalizations.of(context)!.dialogOk,
                "ok",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: appDesign.colorPrimary),
              ),
              onPressed: () {
                onOkPressed();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.grey.shade200,
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              child: Text(
                // AppLocalizations.of(context)!.dialogCancel,
                "Cancel",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: appDesign.colorAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  // Future<void> saveCountryID(int id) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt("countryID", id);
  // }
  // Future<int?> getCountryID() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt("countryID");
  // }
  // Future<void> saveIsFirst(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("keyIsFirst", value);
  // }
  //
  // Future<bool?> getIsFirst() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool("keyIsFirst");
  // }
  //
  // Future<void> saveIsEnglish(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool("keyEnglish", value);
  // }
  //
  // Future<bool?> getIsEnglish() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool("keyEnglish");
  // }
  //
  // Future<void> saveUser(User userToSave) async {
  //    final user = userToSave;
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String userJson = jsonEncode(user.toJson());
  //   await prefs.setString("user", userJson).then((isSave) {
  //     if (isSave) {
  //       print("ADD TO SF");
  //       _saveUserData(userToSave.name , userToSave.id!,userToSave.town!.city!.countryId);
  //
  //     }
  //   });
  //
  // }
  //  void _saveUserData (String name ,int userID, int contryID){
  //  UserData.userName = name;
  //  UserData.userId = userID;
  //  UserData.countryId = contryID;
  //
  //  print("USER NAME IS :${UserData.userName}");
  //
  //    }
  // Future<User?> getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userJson = prefs.getString("user");
  //   if (userJson != null) {
  //     Map<String, dynamic> userMap = jsonDecode(userJson);
  //     return User.fromJson(userMap);
  //   }
  //   return null;
  // }
  //
  // Future<void> saveSearch(Search? searchToSave) async {
  //
  //   final user = searchToSave;
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String userJson = jsonEncode(user!.toJson());
  //   await prefs.setString("search", userJson);
  //
  // }
  //
  // Future<Search?> getSearch() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userJson = prefs.getString("search");
  //   if (userJson != null) {
  //     Map<String, dynamic> userMap = jsonDecode(userJson);
  //     return Search.fromJson(userMap);
  //   }
  //   return null;
  // }
  // void _clearUserData() {
  //   UserData.countryId = 25;
  //   UserData.deviceToken = "";
  //   UserData.userId = 0;
  //   UserData.userName = "";
  //
  // }
  // void deleteUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //    await prefs.remove("user").then((isDeleted) {
  //      if (isDeleted) {
  //        _clearUserData();
  //      }});
  // }
  //
  // String _formatDuration(Duration duration) {
  //   String twoDigits(int n) => n.toString().padLeft(2, "0");
  //   String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  //   String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  //   if (twoDigitMinutes == "0") {
  //     return UserData.language == "en" ? ("${twoDigitSeconds} ${AppLocalizations.of(this)!.sec}") :
  //     ("${convertNumberToArabic(twoDigitSeconds)} ${AppLocalizations.of(this)!.sec}");
  //   }
  //   if (twoDigits(duration.inHours) == "0") {
  //     return UserData.language == "en" ? "${twoDigitMinutes} ${AppLocalizations.of(this)!.minunets}":
  //     "${convertNumberToArabic(twoDigitMinutes)} ${AppLocalizations.of(this)!.minunets}";
  //   }
  //   return UserData.language == "en" ? "${twoDigits(duration.inHours)} ${AppLocalizations.of(this)!.hour}":
  //   "${convertNumberToArabic(twoDigits(duration.inHours))} ${AppLocalizations.of(this)!.hour}";
  // }
  //
  // String getTimeDifference(String datetime) {
  //   DateTime parsedDate = DateTime.parse(datetime).toUtc();
  //   Duration difference = parsedDate.difference(DateTime.now().toUtc());
  //
  //   if (difference.inHours.abs() >= 24) {
  //     // Display difference in days
  //     int days = difference.inDays.abs();
  //     if (UserData.language == "ar") {
  //       return "${difference.isNegative ? '' : ''}${convertNumberToArabic(days.toString())} ${AppLocalizations.of(this)!.day}${days > 1
  //           ? ''
  //           : ''}";
  //
  //     } else {
  //       return "${difference.isNegative ? '' : ''}$days ${AppLocalizations.of(this)!.day}${days > 1
  //           ? ''
  //           : ''}";
  //     }
  //
  //   } else {
  //     // Display difference in hours
  //     String formattedDifference = _formatDuration(difference.abs());
  //     return "${difference.isNegative ? '' : ''}$formattedDifference";
  //   }
  // }
  //
  // void _changeLanguage(String lang) {
  //   UserData.language = lang;
  //   //todo change thw way to never re run app
  //   runApp(MyApp());
  // }
  // void changeLanguageToEnglish() {
  //
  //       _changeLanguage('en');
  // }
  //
  // void changeLanguageToArabic() {
  //   _changeLanguage('ar');
  // }

  String convertNumberToArabic(String number) {
    final Map<String, String> arabicNumbers = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    String arabicNumber = '';
    for (int i = 0; i < number.length; i++) {
      final String digit = number[i];
      arabicNumber += arabicNumbers[digit] ?? digit;
    }

    return arabicNumber;
  }
}

//Auth
extension EmailValidator on String {
  bool isValidEmail() {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(this);
  }

  bool isValidName() {
    final RegExp regex = RegExp(r'^[\p{L}\s]{3,100}$', unicode: true);
    return regex.hasMatch(this);
  }

  bool isValidNumber() {
    final RegExp regex = RegExp(r'^[\p{N}]{3,20}$', unicode: true);
    return regex.hasMatch(this);
  }

  // bool isStrongPassword() {
  //   final RegExp regex = RegExp(r'^\s*.{8}\s*$');
  //   print("is Strong");
  //   print(regex.hasMatch(this));
  //   return regex.hasMatch(this);
  // }
}
