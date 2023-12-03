import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Views/Shared/consultancyWidgets.dart';
import 'package:canadianslife/Views/consultancyFormView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Consultancy1 extends StatefulWidget {
  const Consultancy1({super.key, required this.nextPage});
  final Function nextPage;

  @override
  State<Consultancy1> createState() => _Consultancy1State();
}

class _Consultancy1State extends State<Consultancy1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Consultancy.constultanceForm.userId =
        Provider.of<UserData>(context, listen: false).userInfo.id;
  }

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController passportNo = TextEditingController();
  final TextEditingController passportSource = TextEditingController();
  final TextEditingController passportCopy = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController statue = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullName.dispose();
    email.dispose();
    age.dispose();
    phone.dispose();
    passportNo.dispose();
    passportSource.dispose();
    passportCopy.dispose();
    country.dispose();
    statue.dispose();
  }

  updateData() {
    Consultancy.constultanceForm.passportNo = passportNo.text;
    Consultancy.constultanceForm.passportIssuer = passportSource.text;
    Consultancy.constultanceForm.passportImage = passportCopy.text;
    Consultancy.constultanceForm.maritalStatus = 0;
    Consultancy.constultanceForm.residenceCountry = country.text;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "البيانات الشخصية",
            style: TextStyle(
              color: appDesign.colorAccent,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Image(
          image: AssetImage("images/c1.png"),
          height: 150,
          width: 50,
        ),
        const SizedBox(height: 20),
        cTextField(
            context, fullName, "الاسم بالكامل", "ادخل اسمك بالكامل", false),
        cTextField(context, email, "البريد الإلكتروني",
            "123456abcdefgh@linkyou.ca", true),
        cTextField(context, age, "العمر (سنة)", "ادخل عمرك هنا", false),
        cTextField(context, phone, "رقم التليفون", "1111111111111", true),
        cTextField(
            context, passportNo, "رقم جواز السفر", "ادخل رقم جواز سفرك", false),
        cTextField(context, passportSource, "صادر من",
            "ادخل جهة اصدار جواز سفرك هنا", false),
        cTextField(context, passportCopy, "نسخة من جواز السفر",
            "قم بالتقاط او تحميل صورة من جواز سفرك", false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {},
              color: appDesign.colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Text(
                    'التقاط صورة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            MaterialButton(
              minWidth: Dimensions.widthPercentage(context, 40),
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: appDesign.colorPrimary, width: 2),
                // side: const BorderSide(color: appDesign.colorUnhighlighted, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Text(
                    'رفع ملف',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appDesign.colorPrimary,
                      // color: appDesign.colorUnhighlighted,
                      fontSize: 18,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: appDesign.colorPrimary,
                  ),
                ],
              ),
            ),
          ],
        ),
        cTextField(context, country, "بلد الإقامة",
            "ادخل اسم البلد المقيم بها حالياً هنا", false),
        cTextField(context, statue, "الحالة الإجتماعية",
            "ادخل حالتك الإجتماعية هنا", false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              enableFeedback: false,
              height: 45,
              minWidth: Dimensions.widthPercentage(context, 45),
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                // side: const BorderSide(color: appDesign.colorPrimary, width: 2),
                side: const BorderSide(
                    color: appDesign.colorUnhighlighted, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'السابق',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // color: appDesign.colorPrimary,
                  color: appDesign.colorUnhighlighted,
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
                widget.nextPage();
                updateData();
              },
              color: appDesign.colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'التالي',
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
