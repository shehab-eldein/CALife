import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/AdilAwdahView.dart';
import 'package:canadianslife/Views/GroupsTabsView.dart';
import 'package:canadianslife/Views/HomeView.dart';
import 'package:canadianslife/Views/askForConsultancyView.dart';
import 'package:canadianslife/Views/myAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

int currentIndex = 0;

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        inactiveIcon: const Icon(Icons.home_outlined),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        title:
            currentIndex == 0 ? (AppLocalizations.of(context)!.mainHome) : null,
        activeColorPrimary: appDesign.colorPrimaryDark,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.groups),
        inactiveIcon: const Icon(Icons.groups_outlined),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        title: currentIndex == 1
            ? (AppLocalizations.of(context)!.mainGroups)
            : null,
        activeColorPrimary: appDesign.colorPrimaryDark,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: Image.asset(
          'images/iconmiddle.png',
          scale: 1,
          fit: BoxFit.scaleDown,
        ),
        icon: Image.asset(
          'images/iconcanada2.png',
          scale: 1,
          fit: BoxFit.scaleDown,
        ),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        // title: (AppLocalizations.of(context)!.mainAdelAwdah),
        activeColorPrimary: appDesign.colorPrimaryDark,
        inactiveColorPrimary: appDesign.colorPrimaryDark,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people),
        inactiveIcon: const Icon(Icons.people_outline),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        title: currentIndex == 3
            ? (AppLocalizations.of(context)!.consultancy)
            : null,
        activeColorPrimary: appDesign.colorPrimaryDark,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        inactiveIcon: const Icon(Icons.person_outline),
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        title: currentIndex == 4
            ? (AppLocalizations.of(context)!.mainUserAccount)
            : null,
        activeColorPrimary: appDesign.colorPrimaryDark,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    List<Widget> buildScreens() {
      return [
        const HomeView(),
        const GroupsTabsView(),
        const AdilAwdah(),
        const AskForConsiltancyView(),
        // OnboardingScreen(),
        const MyAccountView(),
      ];
    }

    return PersistentTabView(
      context,
      controller: Constant.controller,
      screens: buildScreens(),
      items: _navBarsItems(context),
      onItemSelected: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      confineInSafeArea: true,
      backgroundColor: appDesign.backGround,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              color: Colors.black.withAlpha(13),
              offset: const Offset(0, -2))
        ],
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        curve: Curves.easeInExpo,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeInExpo,
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
