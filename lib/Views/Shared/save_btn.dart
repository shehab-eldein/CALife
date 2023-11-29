import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';
import '../../colors.dart';

// ignore: must_be_immutable
class SaveBtn extends StatefulWidget {
  SaveBtn({super.key, required this.onPressed});
  Function onPressed;
  @override
  State<SaveBtn> createState() => _SaveBtnState();
}

class _SaveBtnState extends State<SaveBtn> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: lightBlueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: Text(
        "حفظ",
        style: TextStyle(
            fontFamily: '.SF Arabic',
            color: Colors.white,
            fontSize: Dimensions.fontSize(context, 1.3)),
      ),
    );
  }
}
