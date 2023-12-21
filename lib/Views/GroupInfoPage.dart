import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:flutter/material.dart';

class GroupInfoPage extends StatefulWidget {
  const GroupInfoPage({super.key, required this.info});
  final String info;
  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 10),
        child: Text(
          widget.info,
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: '.SF Arabic',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ));
  }
}
