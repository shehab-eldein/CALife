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
      leading: InkWell(
        onTap: () {},
        child: Visibility(
          child: BackButton(
              color: appDesign.colorPrimaryDark,
              onPressed: () {
                Navigator.pop(context);
              }),
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: showBackButton!,
        ),
      ),
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
