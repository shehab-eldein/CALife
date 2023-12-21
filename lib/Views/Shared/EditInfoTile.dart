import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter/material.dart';
import '../../Helper/responsive.dart';

// ignore: must_be_immutable
class AppEditInfoTile extends StatefulWidget {
  AppEditInfoTile(
      {super.key,
      required this.title,
      required this.trailing,
      required this.onPressed});
  String title;
  String trailing;
  Function onPressed;
  @override
  State<AppEditInfoTile> createState() => _AppEditInfoTileState();
}

class _AppEditInfoTileState extends State<AppEditInfoTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: ListTile(
        shape: const Border(
          bottom: BorderSide(color: appDesign.colorPrimaryDark, width: 1),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
              fontFamily: '.SF Arabic',
              color: const Color(0xFF484C52),
              fontSize: Dimensions.fontSize(context, 1.5),
              fontWeight: FontWeight.w600),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text(
              ' ${widget.trailing.length < 24 ? widget.trailing : '${widget.trailing.substring(0, 18)}...'}',
              style: TextStyle(
                fontFamily: '.SF Arabic',
                color: const Color(0xFF484C52),
                fontSize: Dimensions.fontSize(context, 1.2),
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: appDesign.colorAccent,
              size: Dimensions.fontSize(context, 2),
            ),
          ],
        ),
      ),
    );
  }
}
