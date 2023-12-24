import 'package:canadianslife/Helper/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    loadData();
    askAppTrackingIOS();
    //_getLanguages();
  }

  Future<void> askAppTrackingIOS() async {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));

      await AppTrackingTransparency.requestTrackingAuthorization();
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    print("UUID: $uuid");
  }

  // void _getUser() {
  //   context.getUser().then((user) {
  //     if (user != null) {
  //       UserData.userId = user.id!;
  //       UserData.userName = user.name!;
  //       UserData.userNumber = user.phone1!;
  //     }
  //   });
  // }
  //
  // void _getLanguages() {
  //   context.getIsEnglish().then((isEnglish) {
  //     if (isEnglish != null) {
  //       if (isEnglish) {
  //         UserData.language = "en";
  //       } else {
  //         UserData.language = "ar";
  //       }
  //     }
  //   });
  // }
  //
  // void _navigationDestination() {
  //   context.getIsFirst().then((value) {
  //     if (value != null) {
  //       if (value) {
  //         context.navigateTo(CountriesView());
  //       } else{
  //         context.navigateTo(bottomBar());
  //         //context.navigateTo(cpTopBarView());
  //         //context.navigateTo(ChatView2());
  //         //context.navigateTo(SignUpView());
  //
  //       }
  //
  //     } else {
  //
  //       context.navigateTo(CountriesView());
  //     }
  //   });
  // }
  //

  loadData() async {
    await Provider.of<UserData>(context, listen: false).loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoaded = true;
      });
      // context.navigateTo(OnboardingScreen());
      // context.navigateTo(AuthenticationService());
      // _getUser();
      //
      // _navigationDestination();
    });

    return isLoaded
        ? const AuthenticationService()
        : Scaffold(
            backgroundColor: appDesign.backGround,
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Image.asset("images/applogo.png"),
              ),
            ));
  }
}
