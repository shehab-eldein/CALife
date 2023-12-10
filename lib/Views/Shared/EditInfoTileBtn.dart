import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';

// ignore: must_be_immutable
class AppListTileBtn extends StatefulWidget {
  AppListTileBtn({
    super.key,
    required this.title,
    required this.trailing,
    required this.icon,
    required this.trailingColor,
    required this.onPressed,
  });
  String title;
  String trailing;
  IconData icon;
  Color trailingColor;
  Function onPressed;
  @override
  State<AppListTileBtn> createState() => _AppListTileBtnState();
}

class _AppListTileBtnState extends State<AppListTileBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: ListTile(
        shape: const Border(
          bottom: BorderSide(color: appDesign.colorPrimaryLight, width: 1),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
              fontFamily: '.SF Arabic',
              color: const Color(0xFF484C52),
              fontSize: Dimensions.fontSize(context, 1.5),
              fontWeight: FontWeight.w600),
        ),
        trailing: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            side: BorderSide(
              width: 1.0,
              color: widget.trailingColor,
            ),
          ),
          onPressed: () {
            widget.onPressed();
          },
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            children: [
              Icon(
                widget.icon,
                color: widget.trailingColor,
                size: Dimensions.fontSize(context, 2),
              ),
              Text(
                widget.trailing,
                style: TextStyle(
                    fontFamily: '.SF Arabic',
                    color: widget.trailingColor,
                    fontSize: Dimensions.fontSize(context, 1.2),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
