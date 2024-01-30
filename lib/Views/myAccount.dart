import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Views/Shared/myAccountTile.dart';
import 'package:canadianslife/Views/Shared/outlinedButton.dart';
import 'package:canadianslife/Views/Shared/profileInfoRow.dart';
import 'package:canadianslife/Views/editInfoView.dart';
import 'package:canadianslife/Views/login.dart';
import 'package:canadianslife/Views/myGroups.dart';
import 'package:canadianslife/Views/myPosts.dart';
import 'package:canadianslife/Views/mySettings.dart';
import 'package:canadianslife/Views/myGroups.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});
  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return UserData().userInfo.id > 0
        ? ListView(
            padding: EdgeInsets.symmetric(
                horizontal: layoutManager.mainHorizontalPadding(),
                vertical: 20),
            children: [
              const ProfileInfoRow(),
              const SizedBox(height: 25),
              AppListTile(
                  title: AppLocalizations.of(context)!.editInfo,
                  icon: Icons.edit,
                  onPressed: () {
                    context.navigateTo(const EditInfoView());
                  }),
              const SizedBox(height: 12),
              AppListTile(
                  title: AppLocalizations.of(context)!.myGroups,
                  icon: Icons.groups,
                  onPressed: () {
                    context.navigateTo(MyGroups());
                  }),
              const SizedBox(height: 12),
              AppListTile(
                  title: AppLocalizations.of(context)!.myPosts,
                  icon: Icons.share,
                  onPressed: () {
                    context.navigateTo(const MyPostsView());
                  }),
              const SizedBox(height: 12),
              AppListTile(
                  title: AppLocalizations.of(context)!.mySettings,
                  icon: Icons.settings,
                  onPressed: () {
                    context.navigateTo(const MySettingsView());
                  }),
              const SizedBox(height: 12),
              AppOutlinedButton(
                  title: AppLocalizations.of(context)!.signOut,
                  icon: Icons.exit_to_app,
                  color: appDesign.colorPrimaryDark,
                  onPressed: () {
                    setState(() {
                      Provider.of<UserData>(context, listen: false).signOut();
                      // UserData().signOut();
                    });
                  })
            ],
          )
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: MaterialButton(
                height: 48,
                minWidth: double.infinity,
                color: appDesign.colorPrimaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onPressed: () {
                  Provider.of<UserData>(context, listen: false).signOut();
                },
                child: Text(
                  AppLocalizations.of(context)!.logIn,
                  style: TextStyle(
                      fontFamily: '.SF Arabic',
                      color: Colors.white,
                      fontSize: Dimensions.fontSize(context, 1.3)),
                ),
              ),
            ),
          );
  }
}
