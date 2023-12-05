import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/Shared/myAccountTile.dart';
import 'package:canadianslife/Views/Shared/outlinedButton.dart';
import 'package:canadianslife/Views/Shared/profileInfoRow.dart';
import 'package:canadianslife/Views/editInfoView.dart';
import 'package:canadianslife/Views/myGroups.dart';
import 'package:canadianslife/Views/myPosts.dart';
import 'package:canadianslife/Views/mySettings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});
  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        const ProfileInfoRow(),
        const SizedBox(height: 25),
        AppListTile(
            title: "تعديل البيانات",
            icon: Icons.edit,
            onPressed: () {
              context.navigateTo(const EditInfoView());
            }),
        const SizedBox(height: 12),
        AppListTile(title: "مجموعاتي", icon: Icons.groups, onPressed: () {
          
          context.navigateTo(MyGroups());
        }),
        const SizedBox(height: 12),
        AppListTile(
            title: "منشوراتي",
            icon: Icons.share,
            onPressed: () {
              context.navigateTo(const MyPostsView());
            }),
        const SizedBox(height: 12),
        AppListTile(
            title: "الاعدادات",
            icon: Icons.settings,
            onPressed: () {
              context.navigateTo(const MySettingsView());
            }),
        const SizedBox(height: 12),
        AppOutlinedButton(
            title: "تسجيل الخروج",
            icon: Icons.exit_to_app,
            color: appDesign.colorPrimaryDark,
            onPressed: () {
              setState(() {
                Provider.of<UserData>(context, listen: false).signOut();
                // UserData().signOut();
              });
            })
      ],
    );
  }
}
