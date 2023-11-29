import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';

// ignore: must_be_immutable
class AppListTile extends StatefulWidget {
  AppListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed,
      this.isCustom,
      this.child});
  bool? isCustom;
  Widget? child;
  String title;
  IconData icon;
  Function onPressed;
  @override
  State<AppListTile> createState() => _AppListTileState();
}

class _AppListTileState extends State<AppListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
          color: appDesign.colorPrimaryDark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
                fontFamily: '.SF Arabic',
                color: Colors.white,
                fontSize: Dimensions.fontSize(context, 1.7),
                fontWeight: FontWeight.w600),
          ),
          leading: Icon(
            widget.icon,
            color: Colors.white,
            size: Dimensions.fontSize(context, 2),
          ),
          trailing: widget.isCustom == true
              ? widget.child
              : Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: Dimensions.fontSize(context, 2),
                ),
        ),
      ),
    );
  }
}
