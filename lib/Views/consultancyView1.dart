import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/ImagePickerManager.dart';
import 'package:canadianslife/Views/Shared/consultancyWidgets.dart';
import 'package:canadianslife/Views/consultancyFormView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    Consultancy.constultanceForm.passportImage = image ?? "";
  }

  String? image;
  ImagePickerManager imagePickerManager = ImagePickerManager();

  void pickImage() async {
    String? img = await imagePickerManager.pickOneImage();
    if (img != null) {
      setState(() {
        image = img;
      });
    }
  }

  void takeImage() async {
    String? img = await imagePickerManager.takeImage();
    if (img != null) {
      setState(() {
        image = img;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context)!.personalInfo,
            style: const TextStyle(
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
        cTextField(context, fullName, AppLocalizations.of(context)!.fullName,
            "", false),
        cTextField(
            context, email, AppLocalizations.of(context)!.email, "", true),
        cTextField(context, age, AppLocalizations.of(context)!.age, "", false),
        cTextField(
            context, phone, AppLocalizations.of(context)!.phone, "", true),
        cTextField(context, passportNo,
            AppLocalizations.of(context)!.passportNumber, "", false),
        cTextField(context, passportSource,
            AppLocalizations.of(context)!.passportSource, "", false),
        cTextField(context, passportCopy,
            AppLocalizations.of(context)!.passportCopy, "", false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: Dimensions.widthPercentage(context, 45),
              onPressed: () {
                takeImage();
              },
              color: appDesign.colorPrimaryDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.takePicture,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
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
              minWidth: Dimensions.widthPercentage(context, 45),
              onPressed: () {
                pickImage();
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: appDesign.colorPrimaryDark, width: 2),
                // side: const BorderSide(color: appDesign.colorUnhighlighted, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.uploadFile,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: appDesign.colorPrimaryDark,
                      // color: appDesign.colorUnhighlighted,
                      fontSize: 18,
                      fontFamily: '.SF Arabic',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    color: appDesign.colorPrimaryDark,
                  ),
                ],
              ),
            ),
          ],
        ),
        cTextField(context, country,
            AppLocalizations.of(context)!.countryOfResidence, "", false),
        cTextField(context, statue, AppLocalizations.of(context)!.martialStatus,
            "", false),
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
              child: Text(
                AppLocalizations.of(context)!.previous,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
              color: appDesign.colorPrimaryDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                AppLocalizations.of(context)!.next,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
