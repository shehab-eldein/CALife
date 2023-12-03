import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/GroupCreateView.dart';
import 'package:canadianslife/Views/GroupsTabsView.dart';
import 'package:canadianslife/Views/HomeView.dart';
import 'package:canadianslife/Views/consultancyFormView.dart';
import 'package:canadianslife/Views/myAccount.dart';
import 'package:canadianslife/Views/onBoarding.dart';
import 'package:canadianslife/Views/selectPurpose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: (AppLocalizations.of(context)!.mainHome),
        activeColorPrimary: appDesign.colorPrimary,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people_outline),
        title: (AppLocalizations.of(context)!.mainGroups),
        activeColorPrimary: appDesign.colorPrimary,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'images/iconmiddle.png',
          scale: 1,
          fit: BoxFit.scaleDown,
        ),
        title: (AppLocalizations.of(context)!.mainAdelAwdah),
        activeColorPrimary: appDesign.colorPrimary,
        inactiveColorPrimary: appDesign.colorPrimary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_outlined),
        title: (AppLocalizations.of(context)!.mainNotifs),
        activeColorPrimary: appDesign.colorPrimary,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline_rounded),
        title: (AppLocalizations.of(context)!.mainUserAccount),
        activeColorPrimary: appDesign.colorPrimary,
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
        const ConsultancyView(),
        const GroupCreateView(),
        // OnboardingScreen(),
        const MyAccountView(),
      ];
    }

    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: appDesign.backGround,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
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
