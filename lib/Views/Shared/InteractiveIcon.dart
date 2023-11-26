import 'package:flutter/material.dart';
import 'package:canadianslife/Extinsions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:canadianslife/Helper/Constants.dart';

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
            color: color ?? appDesign.colorAccent,
            size: 20,
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
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
