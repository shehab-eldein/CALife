import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context)!.generalInfo,
            style: TextStyle(
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
          "هل لديك عرض عمل موثق من صاحب عمل كندي؟",
          hasOffer,
          setHasOffer,
        ),
        cYesNo(
          context,
          "هل لديك صديق مقرب يعيش في كندا يبلغ من العمر 18 عامًا أو أكبر؟",
          hasFriend,
          setHasFriend,
        ),
        cYesNo(
          context,
          "هل لديك أفراد أسرة أو أقارب يعيشون في كندا وتبلغ أعمارهم 18 عامًا أو أكثر؟",
          hasFamily,
          setHasFamily,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                "صافي ثروتك الشخصية (بالدولار الأمريكي)",
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
                'بين 10,000 \$ و 25,000 \$',
                textAlign: TextAlign.right,
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
                'بين 25,000 \$ و 100,000 \$',
                textAlign: TextAlign.right,
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
                'بين 100,000 \$ و 500,000 \$',
                textAlign: TextAlign.right,
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
                'بين 500,000 \$ و 1,000,000 \$',
                textAlign: TextAlign.right,
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
                'أكثر من 1,000,000 \$',
                textAlign: TextAlign.right,
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
          "رسوم الاستشارة 200 دولار، هل أنت متأكد أنك تريد المتابعة؟",
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
              child: const Text(
                'السابق',
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
                widget.submit();
              },
              color: appDesign.colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
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
