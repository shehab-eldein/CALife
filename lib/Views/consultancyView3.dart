import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Views/Shared/consultancyWidgets.dart';
import 'package:canadianslife/Views/consultancyFormView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Consultancy3 extends StatefulWidget {
  const Consultancy3({super.key, required this.submit, required this.prevPage});
  final Function submit;
  final Function prevPage;

  @override
  State<Consultancy3> createState() => _Consultancy3State();
}

class _Consultancy3State extends State<Consultancy3> {
  bool? hasOffer;
  setHasOffer(value) {
    setState(() {
      hasOffer = value;
      Consultancy.constultanceForm.hasOffer = value;
    });
  }

  bool? hasFriend;
  setHasFriend(value) {
    setState(() {
      hasFriend = value;
      Consultancy.constultanceForm.hasFriend = value;
    });
  }

  bool? hasFamily;
  setHasFamily(value) {
    setState(() {
      hasFamily = value;
      Consultancy.constultanceForm.hasFamily = value;
    });
  }

  bool? isAgree;
  setIsAgree(value) {
    setState(() {
      isAgree = value;
      Consultancy.constultanceForm.isAgree = value;
    });
  }

  int? netWealth;

  setNetWealth(value) {
    setState(() {
      netWealth = value;
      Consultancy.constultanceForm.netWealth = value;
    });
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return ListView(
      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context)!.generalInfo,
            style: const TextStyle(
              color: appDesign.colorAccent,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Image(
          image: AssetImage("images/c3.png"),
          height: 150,
          width: 50,
        ),
        const SizedBox(height: 20),
        cYesNo(
          context,
          AppLocalizations.of(context)!.jobOffer,
          hasOffer,
          setHasOffer,
        ),
        cYesNo(
          context,
          AppLocalizations.of(context)!.hasFriend,
          hasFriend,
          setHasFriend,
        ),
        cYesNo(
          context,
          AppLocalizations.of(context)!.hasFamily,
          hasFamily,
          setHasFamily,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: layoutManager.mainHorizontalPadding()),
              child: Text(
                AppLocalizations.of(context)!.netWorth,
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: appDesign.colorPrimary,
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                '10,000\$ - 25,000\$',
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: appDesign.colorPrimary,
                value: 0,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                '25,000\$ - 100,000\$',
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: appDesign.colorPrimary,
                value: 1,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                '100,000\$ - 500,000\$',
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: appDesign.colorPrimary,
                value: 2,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                '500,000\$ - 1,000,000\$',
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: appDesign.colorPrimary,
                value: 3,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
            ListTile(
              title: const Text(
                '1,000,000\$+',
                style: TextStyle(
                  color: Color(0xFF474B51),
                  fontSize: 20,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
              leading: Radio<int>(
                activeColor: appDesign.colorPrimary,
                value: 4,
                groupValue: netWealth,
                onChanged: (value) {
                  setNetWealth(value);
                },
              ),
            ),
          ],
        ),
        cYesNo(
          context,
          AppLocalizations.of(context)!.fees,
          isAgree,
          setIsAgree,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 45),
              onPressed: () {
                widget.prevPage();
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: appDesign.colorPrimary, width: 2),
                // side: const BorderSide(color: Color(0x3F474B51), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                AppLocalizations.of(context)!.previous,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: appDesign.colorPrimary,
                  // color: Color(0x3F474B51),
                  fontSize: 18,
                  fontFamily: '.SF Arabic',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.widthPercentage(context, 3),
            ),
            MaterialButton(
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 45),
              onPressed: () {
                setState(() {
                  isPressed = true;
                });
                widget.submit();
              },
              color: appDesign.colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: isPressed
                  ? const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'ارسال',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: '.SF Arabic',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
