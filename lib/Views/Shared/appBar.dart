import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Views/notificationsView.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:canadianslife/Helper/Constants.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final BuildContext widgetContext;
  final bool? showBackButton;
  final bool? showSearch;
  final bool? showNotification;

  BaseAppBar(
      {required this.appBar,
      required this.widgetContext,
      required this.showBackButton,
      this.showSearch,
      this.showNotification}) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: showBackButton != null && showBackButton! == false
          ? UserData().isLoggedIn()
              ? SizedBox()
              // --------------- NOTIFICATIONS ICON ---------------------
              // Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         color: Colors.white,
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 4,
              //             spreadRadius: 0,
              //             color: Colors.black.withAlpha(38),
              //             offset: const Offset(0, 1),
              //           ),
              //         ],
              //       ),
              //       child: Material(
              //         color: Colors.transparent,
              //         child: InkWell(
              //           borderRadius: BorderRadius.circular(50),
              //           splashColor: Colors.grey[500],
              //           onTap: () {
              //             context.navigateTo(const NotificationsView());
              //           },
              //           child: const Icon(
              //             Icons.notifications_none_outlined,
              //             color: appDesign.colorPrimaryDark,
              //           ),
              //         ),
              //       ),
              //     ),
              //   )
              : SizedBox()
          : Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: showBackButton!,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Colors.black.withAlpha(38),
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: BackButton(
                        color: appDesign.colorPrimaryDark,
                        onPressed: () {
                          Navigator.of(
                                  Constant.navigatorKey.currentState!.context)
                              .pop();
                        }),
                  ),
                ),
              ),
            ),
      // InkWell(
      //     onTap: () {},
      //     child: Visibility(
      //       maintainSize: true,
      //       maintainAnimation: true,
      //       maintainState: true,
      //       visible: showBackButton!,
      //       child: BackButton(
      //           color: appDesign.colorPrimaryDark,
      //           onPressed: () {
      //             Navigator.of(Constant.navigatorKey.currentState!.context)
      //                 .pop();
      //           }),
      //     ),
      //   ),
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
        child: Image.asset('images/appBarCenterLogo.png',
            height: 40, fit: BoxFit.fill),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset('images/appBarSlogan.png',
              height: 50, fit: BoxFit.fill),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
