import 'dart:convert';

import 'Group.dart';
import 'User.dart';

class GroupSubscriber {
  GroupSubscriber({
    required this.id,
    required this.groupId,
    this.group ,
    required this.userId,
    this.user,
    required this.joinDate,
    required this.requestDate,
    required this.subscriberStatus,
  });

  int id;
  int groupId;
  Group? group;
  int userId;
  User? user;
  String joinDate ;
  String requestDate ;
  int subscriberStatus;


  factory GroupSubscriber.fromJson(Map<String, dynamic> json) => GroupSubscriber(
    id: json["id"],
    joinDate: json["joinDate"],
    requestDate: json["requestDate"],
    subscriberStatus: json["subscriberStatus"],
    groupId: json["groupId"],
    group: json["group"] != null ? Group.fromJson(json["group"]) : null,
    userId: json["userId"],
    user: json["user"] != null ? User.fromJson(json["user"]) : null,

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'joinDate': joinDate,
    'requestDate': requestDate,
    'subscriberStatus': subscriberStatus,
    'groupId': groupId,
    'group': group,
    'userId': userId,
    'user': user,
  };
}


