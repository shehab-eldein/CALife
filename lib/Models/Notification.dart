import 'package:canadianslife/Models/Group.dart';
import 'package:canadianslife/Models/Topic.dart';
import 'package:canadianslife/Models/User.dart';

class AppNotification {
  AppNotification({
    required this.id,
    required this.notifType,
    this.fromUserName,
    this.user,
    required this.toUserId,
    this.group,
    this.groupId,
    this.topic,
    this.topicId,
    required this.isNotified,
    this.notifDateTime,
  });
  int id;
  int notifType;
  String? fromUserName;
  User? user;
  int toUserId;
  Group? group;
  int? groupId;
  Topic? topic;
  int? topicId;
  bool isNotified;
  String? notifDateTime;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      AppNotification(
        id: json["id"],
        notifType: json["notifType"],
        fromUserName: json["fromUserName"],
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
        toUserId: json["toUserId"],
        group: json["group"] != null ? Group.fromJson(json["group"]) : null,
        groupId: json["groupId"],
        topic: json["topic"] != null ? Topic.fromJson(json["topic"]) : null,
        topicId: json["topicId"],
        isNotified: json["isNotified"],
        notifDateTime: json["notifDateTime"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'notifType': notifType,
        'fromUserName': fromUserName,
        'user': user,
        'toUserId': toUserId,
        'group': group,
        'groupId': groupId,
        'topic': topic,
        'topicId': topicId,
        'isNotified': isNotified,
        'notifDateTime': notifDateTime,
      };
}
