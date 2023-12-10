import 'package:canadianslife/Models/GroupSubscriber.dart';
import 'package:canadianslife/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({
    super.key,
    required this.notification,
  });
  final String notification;
  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: 3),
      shape: const Border(
        bottom: BorderSide(color: appDesign.colorUnhighlighted, width: 1),
      ),
      title: Text(
        widget.notification,
        textAlign: TextAlign.right,
        style: const TextStyle(
          color: Color(0xFF323438),
          fontSize: 17,
          fontFamily: '.SF Arabic',
          fontWeight: FontWeight.bold,
          height: 0.08,
        ),
      ),
      leading: const CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage: AssetImage("images/person.png"),
        radius: 25,
      ),
      trailing: const Text(
        '10 د',
        style: TextStyle(
          color: Color(0xFF818796),
          fontSize: 15,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }
}
