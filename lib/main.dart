import 'package:canadianslife/Views/onBoarding.dart';
import 'package:canadianslife/Views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
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
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(),
      child: const MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Provider.of<UserData>(context, listen: false).loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, userData, child) {
      return FlutterBootstrap5(
        builder: (ctx) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Canadians Life',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(
              Provider.of<UserData>(context, listen: false).userLanguage),
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: appDesign.colorPrimaryDark),
            useMaterial3: true,
          ),
          // home: SplashView(),
          home: userData.isFirstRun == true
              ? const OnboardingScreen()
              : const SplashView(),
        ),
      );
    });
  }
}
