import 'package:canadianslife/Helper/Authentication.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/GroupDetailsView.dart';
import 'package:canadianslife/Views/GroupsTabsView.dart';
import 'package:canadianslife/Views/editInfoView.dart';
import 'package:canadianslife/Views/login.dart';
import 'package:canadianslife/Views/myAccount.dart';
import 'package:canadianslife/Views/myPosts.dart';
import 'package:canadianslife/Views/mySettings.dart';
import 'package:canadianslife/Views/postView.dart';
import 'package:canadianslife/Views/signup.dart';
import 'package:canadianslife/Views/testView.dart';
import 'package:canadianslife/Views/topicView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({Key? key}) : super(key: key);

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: (AppLocalizations.of(context)!.mainHome),
        activeColorPrimary: appDesign.colorPrimary,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.people_outline),
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
        icon: Icon(Icons.notifications_outlined),
        title: (AppLocalizations.of(context)!.mainNotifs),
        activeColorPrimary: appDesign.colorPrimary,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outline_rounded),
        title: (AppLocalizations.of(context)!.mainUserAccount),
        activeColorPrimary: appDesign.colorPrimary,
        inactiveColorPrimary: appDesign.colorUnhighlighted,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    List<Widget> _buildScreens() {
      return [
        GroupDetails(),
        GroupsTabsView(),
        GroupsTabsView(),
        // GroupsTabsView(),
        TopicView(),
        MyAccountView(),
      ];
    }

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
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
      itemAnimationProperties: ItemAnimationProperties(
        curve: Curves.easeInExpo,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeInExpo,
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
