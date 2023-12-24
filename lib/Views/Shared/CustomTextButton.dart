import 'package:canadianslife/Helper/responsive.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final IconData? icon;
  final Color? iconColor;
  final double? width;

  const CustomTextButton({
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.icon,
    this.iconColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      color: backgroundColor,
      child: MaterialButton(
        height: 45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize(context, 1.3)),
            ),
            const SizedBox(width: 8),
            icon != null
                ? Icon(
                    icon,
                    color: iconColor ?? Colors.white,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
