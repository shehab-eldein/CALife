import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget cTextField(
  BuildContext context,
  TextEditingController controller,
  String title,
  String hint,
  bool isRequired,
) {
  final layoutManager = LayoutManager(context);
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: 5, horizontal: layoutManager.mainHorizontalPadding()),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: ".SF Arabic",
              color: appDesign.colorPrimary,
              fontSize: Dimensions.fontSize(context, 1.7),
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          Text(
            isRequired ? "*" : "",
            style: TextStyle(
              fontFamily: ".SF Arabic",
              color: Colors.red,
              fontSize: Dimensions.fontSize(context, 1.7),
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        style: TextStyle(
          height: 0.9,
          fontFamily: ".SF Arabic",
          fontSize: Dimensions.fontSize(context, 1.2),
        ),
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
    ]),
  );
}

Widget cYesNo(
    BuildContext context, String title, dynamic value, Function setValue) {
  final layoutManager = LayoutManager(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: 5, horizontal: layoutManager.mainHorizontalPadding()),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: ".SF Arabic",
            color: appDesign.colorPrimary,
            fontSize: Dimensions.fontSize(context, 1.7),
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      const SizedBox(height: 15),
      ListTile(
        horizontalTitleGap: 5,
        title: Text(
          AppLocalizations.of(context)!.yes,
          style: const TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: ".SF Arabic",
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<bool>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          activeColor: appDesign.colorAccent,
          value: true,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        horizontalTitleGap: 5,
        title: Text(
          AppLocalizations.of(context)!.no,
          style: const TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: ".SF Arabic",
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<bool>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          activeColor: appDesign.colorAccent,
          value: false,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
    ],
  );
}

Widget cRate(BuildContext context, String title, dynamic value,
    Function setValue, String? subTitle) {
  final layoutManager = LayoutManager(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: ".SF Arabic",
            color: appDesign.colorPrimary,
            fontSize: Dimensions.fontSize(context, 1.7),
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
      subTitle != null ? const SizedBox(height: 20) : const SizedBox(),
      subTitle != null
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: layoutManager.mainHorizontalPadding()),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontFamily: ".SF Arabic",
                  color: appDesign.colorPrimary,
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
            )
          : const SizedBox(),
      const SizedBox(height: 0),
      ListTile(
        horizontalTitleGap: 5,
        title: Text(
          AppLocalizations.of(context)!.option5,
          style: const TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: ".SF Arabic",
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          activeColor: appDesign.colorAccent,
          value: 5,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        horizontalTitleGap: 5,
        title: Text(
          AppLocalizations.of(context)!.option4,
          style: const TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: ".SF Arabic",
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          activeColor: appDesign.colorAccent,
          value: 4,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        horizontalTitleGap: 5,
        title: Text(
          AppLocalizations.of(context)!.option3,
          style: const TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: ".SF Arabic",
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          activeColor: appDesign.colorAccent,
          value: 3,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        horizontalTitleGap: 5,
        title: Text(
          AppLocalizations.of(context)!.option2,
          style: const TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: ".SF Arabic",
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          activeColor: appDesign.colorAccent,
          value: 2,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        horizontalTitleGap: 5,
        title: Text(
          AppLocalizations.of(context)!.option1,
          style: const TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: ".SF Arabic",
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          activeColor: appDesign.colorAccent,
          value: 1,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
      ListTile(
        horizontalTitleGap: 5,
        title: Text(
          AppLocalizations.of(context)!.option0,
          style: const TextStyle(
            color: Color(0xFF474B51),
            fontSize: 20,
            fontFamily: ".SF Arabic",
            fontWeight: FontWeight.w500,
            height: 0.08,
          ),
        ),
        leading: Radio<int>(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          activeColor: appDesign.colorAccent,
          value: 0,
          groupValue: value,
          onChanged: (value) {
            setValue(value);
          },
        ),
      ),
    ],
  );
}
