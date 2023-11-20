import 'package:canadianslife/Helper/Authentication.dart';
import 'package:canadianslife/Views/GroupsTabsView.dart';
import 'package:canadianslife/Views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:provider/provider.dart';
import 'Views/Shared/BottomNavigation.dart';
import 'Views/Shared/appBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Views/onBoarding.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FlutterBootstrap5(
      builder: (ctx) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(UserData.language),
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: appDesign.colorPrimaryDark),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: BaseAppBar(
            appBar: AppBar(),
            widgetContext: context,
            showBackButton: false,
          ),
          body: AuthenticationService(),
        ),
      ),
    );
  }
}
