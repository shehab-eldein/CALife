import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';

// ignore: must_be_immutable
class InteractiveIcon extends StatelessWidget {
  final IconData icon;
  Color? color;
  String text;
  Function? onPressed;
  InteractiveIcon(
      {Key? key,
      required this.icon,
      this.color,
      required this.text,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? appDesign.colorAccentDarker,
            size: 20,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
