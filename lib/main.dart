import 'package:canadianslife/Views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:provider/provider.dart';
import 'Views/Shared/appBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:device_preview/device_preview.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: true,
//         builder: (context) => ChangeNotifierProvider(
//           create: (context) => UserData(),
//           child: const MyApp(),
//         ),
//       ),
//     );

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
    return Consumer<UserData>(builder: (context, userData, child) {
      return FlutterBootstrap5(
        builder: (ctx) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Candaians Life',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(
              Provider.of<UserData>(context, listen: false).userLanguage),
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: appDesign.colorPrimaryDark),
            useMaterial3: true,
          ),
          home: SplashView(),
        ),
      );
    });
  }
}
