import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Views/Shared/myAccountTile.dart';
import 'package:canadianslife/Views/Shared/postCard.dart';
import 'package:canadianslife/Views/Shared/profileInfoRow.dart';
import 'package:flutter/material.dart';

class MySettingsView extends StatefulWidget {
  const MySettingsView({super.key});

  @override
  State<MySettingsView> createState() => _MySettingsViewState();
}

class _MySettingsViewState extends State<MySettingsView> {
  bool notifications = true;
  void changeValue(value) {
    setState(() {
      notifications == !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        const ProfileInfoRow(),
        const SizedBox(height: 25),
        AppListTile(
          title: "الإشعارات",
          icon: Icons.notifications_outlined,
          onPressed: () {},
          isCustom: true,
          child: Switch(
            activeTrackColor: const Color(0xFF04BFDB),
            value: notifications,
            onChanged: changeValue,
          ),
        ),
        const SizedBox(height: 12),
        AppListTile(
          title: "اللغة",
          icon: Icons.language_outlined,
          onPressed: () {},
          isCustom: true,
          child: Switch(
            activeTrackColor: const Color(0xFF04BFDB),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications == value;
              });
            },
          ),
        ),
      ],
    );
  }
}
