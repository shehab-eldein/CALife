import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';

// ignore: must_be_immutable
class AppOutlinedButton extends StatefulWidget {
  AppOutlinedButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.onPressed});
  String title;
  IconData icon;
  Color color;
  Function onPressed;
  @override
  State<AppOutlinedButton> createState() => _AppOutlinedButtonState();
}

class _AppOutlinedButtonState extends State<AppOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: BorderSide(
          width: 2.0,
          color: widget.color,
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: widget.color,
              size: Dimensions.fontSize(context, 2.5),
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: widget.color,
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
