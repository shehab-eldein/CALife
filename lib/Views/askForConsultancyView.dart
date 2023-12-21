import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Views/consultancyFormView.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AskForConsiltancyView extends StatefulWidget {
  const AskForConsiltancyView({super.key});

  @override
  State<AskForConsiltancyView> createState() => _AskForConsiltancyViewState();
}

class _AskForConsiltancyViewState extends State<AskForConsiltancyView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage("images/consult.png"),
        ),
        Text(
          AppLocalizations.of(context)!.askC1,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xBF030F2E),
            fontSize: 22,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        Container(
          width: Dimensions.widthPercentage(context, 90),
          child: Text(
            AppLocalizations.of(context)!.askC2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0x7F030F2E),
              fontSize: 17,
              fontFamily: '.SF Arabic',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        const SizedBox(height: 20),
        MaterialButton(
          color: appDesign.colorPrimary,
          onPressed: () {
            context.navigateTo(const ConsultancyView());
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 5,
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    AppLocalizations.of(context)!.askForC,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w500,
                      height: 0.08,
                    ),
                  ),
                ),
                const Icon(
                  Icons.language,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
