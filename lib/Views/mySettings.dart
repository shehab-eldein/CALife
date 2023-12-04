import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Views/Shared/myAccountTile.dart';
import 'package:canadianslife/Views/Shared/profileInfoRow.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../Helper/Constants.dart';

class MySettingsView extends StatefulWidget {
  const MySettingsView({super.key});

  @override
  State<MySettingsView> createState() => _MySettingsViewState();
}

class _MySettingsViewState extends State<MySettingsView> {
  bool isEnglish = true;

  void _langSelection() {
    if (UserData.language == "en") {
      isEnglish = true;
    } else {
      isEnglish = false;
    }
  }

  bool notifications = true;
  void changeValue(value) {
    setState(() {
      notifications == !value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 20),
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
            child: ToggleSwitch(
              customTextStyles: const [
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                )
              ],
              borderColor: const [appDesign.colorAccent],
              borderWidth: 4,
              minHeight: 35,
              minWidth: 80.0,
              cornerRadius: 20.0,
              activeBgColors: const [
                [appDesign.colorAccent],
                [appDesign.colorAccent]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              inactiveFgColor: appDesign.colorPrimaryDark,
              initialLabelIndex: isEnglish ? 1 : 0,
              totalSwitches: 2,
              labels: const ['العربية', 'English'],
              radiusStyle: false,
              onToggle: (index) {
                if (index == 1) {
                  isEnglish = true;
                  print("IS ENGLISH");
                  // context.changeLanguageToEnglish();
                  // context.saveIsEnglish(true);
                } else {
                  isEnglish = false;
                  print("IS Arabic");
                  // context.changeLanguageToArabic();
                  //
                  // context.saveIsEnglish(false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
