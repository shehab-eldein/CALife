import 'package:canadianslife/Views/GroupsTabsView.dart';
import 'package:canadianslife/Views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'Views/Shared/BottomNavigation.dart';
import 'Views/Shared/appBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Views/onBoarding.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  FlutterBootstrap5(
      builder: (ctx) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,

        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(UserData.language),
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: appDesign.colorPrimaryDark),
          useMaterial3: true,
        ),
        home:  Scaffold(
            appBar:  BaseAppBar(
              appBar: AppBar(), widgetContext: context, showBackButton: false,),
            body: LoginView()),
      ),
    );
  }
}
