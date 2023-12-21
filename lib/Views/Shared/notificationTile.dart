import 'package:canadianslife/Models/Notification.dart';
import 'package:flutter/material.dart';
import 'package:canadianslife/Helper/Constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({
    super.key,
    required this.notification,
  });
  final AppNotification notification;
  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  String notificationText() {
    String text = "";
    switch (widget.notification.notifType) {
      case 0:
        text =
            "${widget.notification.fromUserName} ${AppLocalizations.of(context)!.likedPostN}";
        break;
      case 1:
        text =
            "${widget.notification.fromUserName} ${AppLocalizations.of(context)!.commentedPostN}";
        break;
      case 2:
        text = AppLocalizations.of(context)!.acceptedN;
        break;
      case 3:
        text = AppLocalizations.of(context)!.pendingN;
        break;
      case 4:
        text =
            "${widget.notification.fromUserName} ${AppLocalizations.of(context)!.joinedN}";
        break;
      case 5:
        text = AppLocalizations.of(context)!.loggedN;
        break;
      default:
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: widget.notification.isNotified
          ? null
          : appDesign.colorPrimaryDark.withAlpha(20),
      // dense: true,
      // visualDensity: const VisualDensity(vertical: 3),
      shape: Border(
        bottom: BorderSide(
            color: widget.notification.isNotified
                ? appDesign.colorUnhighlighted
                : appDesign.colorPrimaryDark,
            width: 1),
      ),
      title: Text(
        notificationText(),
        style: const TextStyle(
          color: Color(0xFF323438),
          fontSize: 17,
          fontFamily: '.SF Arabic',
          fontWeight: FontWeight.bold,
          height: 0.08,
        ),
      ),
      subtitle: widget.notification.notifType == 0 ||
              widget.notification.notifType == 1
          ? Text(
              '${widget.notification.topic!.title.length > 21 ? widget.notification.topic!.title.substring(0, 21) : widget.notification.topic!.title}...',
              style: const TextStyle(
                color: appDesign.colorAccentDarker,
                fontFamily: '.SF Arabic',
                fontWeight: FontWeight.bold,
                height: 0.08,
              ),
            )
          : widget.notification.notifType == 2 ||
                  widget.notification.notifType == 3 ||
                  widget.notification.notifType == 4
              ? Text(
                  widget.notification.group!.name,
                  style: const TextStyle(
                    color: appDesign.colorAccentDarker,
                    fontFamily: '.SF Arabic',
                    fontWeight: FontWeight.bold,
                    height: 0.08,
                  ),
                )
              : null,
      leading: widget.notification.notifType == 5
          ? ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: FadeInImage(
                height: 40,
                width: 40,
                image: NetworkImage(
                    '${Constant.baseURL}imgusers/${UserData().getId()}.jpg'),
                placeholder: const AssetImage(
                  'images/person.png',
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'images/person.png',
                    fit: BoxFit.fill,
                    height: 40,
                    width: 40,
                  );
                },
                fit: BoxFit.fill,
              ),
            )
          : widget.notification.notifType == 0 ||
                  widget.notification.notifType == 1 ||
                  widget.notification.notifType == 4
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: FadeInImage(
                    height: 45,
                    width: 45,
                    image: const AssetImage('images/person.png'),
                    // image: NetworkImage(
                    //     '${Constant.baseURL}imgusers/${widget.notification.fromUserName}.jpg'),
                    placeholder: const AssetImage(
                      'images/person.png',
                    ),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'images/person.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 40,
                      );
                    },
                    fit: BoxFit.fill,
                  ),
                )
              : widget.notification.notifType == 2 ||
                      widget.notification.notifType == 3
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: FadeInImage(
                        height: 45,
                        width: 45,
                        image: NetworkImage(
                            '${Constant.baseURL}imggroups/${widget.notification.groupId}.jpg'),
                        placeholder: const AssetImage(
                          'images/person.png',
                        ),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'images/person.png',
                            fit: BoxFit.fill,
                            height: 40,
                            width: 40,
                          );
                        },
                        fit: BoxFit.fill,
                      ),
                    )
                  : CircleAvatar(
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
