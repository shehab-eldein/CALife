import 'package:canadianslife/Managers/LayoutManager.dart';
import 'package:canadianslife/Views/Shared/notificationTile.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NotificationTile(notification: "لقد علق لينك يو علي منشورك"),
        NotificationTile(notification: "لقد علق لينك يو علي منشورك"),
        NotificationTile(notification: "لقد علق لينك يو علي منشورك"),
        NotificationTile(notification: "لقد علق لينك يو علي منشورك"),
        // NotificationTile(
        //     notification:
        //         "لقد تمت الموافقة علي طلب انضمامك لمجموعة الحياة في تورنتو"),
      ],
    );
  }
}
