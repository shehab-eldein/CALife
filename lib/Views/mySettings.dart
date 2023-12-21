import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Views/Shared/myAccountTile.dart';
import 'package:canadianslife/Views/Shared/profileInfoRow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../Helper/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MySettingsView extends StatefulWidget {
  const MySettingsView({super.key});

  @override
  State<MySettingsView> createState() => _MySettingsViewState();
}

class _MySettingsViewState extends State<MySettingsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _langSelection();
  }

  bool isEnglish = true;

  void _langSelection() {
    if (UserData.language == "en") {
      isEnglish = true;
    } else {
      isEnglish = false;
    }
  }

  bool notifications = true;
  void changeValue() {
    setState(() {
      if (notifications == true) {
        notifications == false;
      } else {
        notifications = true;
      }
    });
  }

  changeLanguage(String value) {
    setState(() {
      // Localizations.override(
      //   context: context,
      //   locale: Locale(value),
      // );
      Provider.of<UserData>(context, listen: false).setLanguage(value);
      print(Provider.of<UserData>(context, listen: false).userLanguage);
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
            title: AppLocalizations.of(context)!.mainNotifs,
            icon: Icons.notifications_outlined,
            onPressed: () {},
            isCustom: true,
            child: Switch(
              activeTrackColor: appDesign.colorAccent,
              value: notifications,
              onChanged: (value) {
                changeValue();
              },
            ),
          ),
          const SizedBox(height: 12),
          AppListTile(
            title: AppLocalizations.of(context)!.language,
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
              minHeight: 25,
              minWidth: 60.0,
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
                  changeLanguage("en");
                  // context.changeLanguageToEnglish();
                  // context.saveIsEnglish(true);
                } else {
                  isEnglish = false;
                  changeLanguage("ar");
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
