import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/Shared/myAccountTile.dart';
import 'package:canadianslife/Views/Shared/outlinedButton.dart';
import 'package:canadianslife/Views/Shared/profileInfoRow.dart';
import 'package:flutter/material.dart';

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
            title: "تعديل البيانات", icon: Icons.edit, onPressed: () {}),
        const SizedBox(height: 12),
        AppListTile(title: "مجموعاتي", icon: Icons.groups, onPressed: () {}),
        const SizedBox(height: 12),
        AppListTile(title: "منشوراتي", icon: Icons.share, onPressed: () {}),
        const SizedBox(height: 12),
        AppListTile(title: "الاعدادات", icon: Icons.settings, onPressed: () {}),
        const SizedBox(height: 12),
        AppOutlinedButton(
            title: "تسجيل الخروج",
            icon: Icons.exit_to_app,
            color: appDesign.colorPrimaryDark,
            onPressed: () {})
      ],
    );
  }
}
