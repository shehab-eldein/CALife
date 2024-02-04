import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotLoggedInView extends StatefulWidget {
  const NotLoggedInView({
    super.key,
  });

  @override
  State<NotLoggedInView> createState() => _NotLoggedInViewState();
}

class _NotLoggedInViewState extends State<NotLoggedInView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage("images/onBoarding.png"),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: Dimensions.widthPercentage(context, 95),
          child: Text(
            AppLocalizations.of(context)!.loggedGuest,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xBF030F2E),
              fontSize: Dimensions.fontSize(context, 1.7),
              fontFamily: '.SF Arabic',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.widthPercentage(context, 90),
          child: Text(
            AppLocalizations.of(context)!.mustLogin,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0x7F030F2E),
              fontSize: Dimensions.fontSize(context, 1.3),
              fontFamily: '.SF Arabic',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          color: appDesign.colorPrimaryDark,
          onPressed: () {
            Provider.of<UserData>(context, listen: false).signOut();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 5,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    AppLocalizations.of(context)!.logIn,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.fontSize(context, 1.4),
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                ),
                Icon(
                  Icons.login,
                  color: Colors.white,
                  size: Dimensions.fontSize(context, 1.8),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
