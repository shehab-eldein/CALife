import 'package:canadianslife/Controllers/UserController.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Helper/responsive.dart';
import 'package:canadianslife/Models/Notification.dart';
import 'package:canadianslife/Views/Shared/notificationTile.dart';
import 'package:canadianslife/Views/loggedInGuest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getUserNotifications();
  }

  List<AppNotification> notifications = [];
  getUserNotifications() async {
    notifications = await UserController().getUserNotifications(
        Provider.of<UserData>(context, listen: false).userInfo.id);
    for (var element in notifications) {
      if (element.isNotified == false) {
        notify(element.id);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  notify(int id) async {
    await UserController().notify(id);
  }

  @override
  Widget build(BuildContext context) {
    return UserData().userInfo.id > 0
        ? isLoading
            ? SizedBox(
                height: Dimensions.screenHeight(context),
                child: const Center(child: CircularProgressIndicator()))
            : ListView(
                children: [
                  ...notifications.map((e) {
                    return NotificationTile(notification: e);
                  })
                ],
              )
        : const NotLoggedInView();
  }
}
