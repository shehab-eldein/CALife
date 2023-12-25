import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class SaveBtn extends StatefulWidget {
  SaveBtn({super.key, required this.onPressed});
  Function onPressed;
  @override
  State<SaveBtn> createState() => _SaveBtnState();
}

class _SaveBtnState extends State<SaveBtn> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      minWidth: double.infinity,
      color: appDesign.colorAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: () {
        widget.onPressed();
        setState(() {
          isPressed = true;
        });
      },
      child: isPressed
          ? const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              AppLocalizations.of(context)!.save,
              style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: Colors.white,
                  fontSize: Dimensions.fontSize(context, 1.3)),
            ),
    );
  }
}
