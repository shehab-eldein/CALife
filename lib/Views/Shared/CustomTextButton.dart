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
      child: Container(
        height: 45,
        width: width ?? 150,
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              icon != null
                  ? Icon(
                      icon,
                      color: iconColor ?? Colors.white,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
