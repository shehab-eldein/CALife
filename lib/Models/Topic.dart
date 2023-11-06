import 'dart:convert';

import 'Group.dart';
import 'TopicImage.dart';
import 'User.dart';

class Topic {
  Topic({
    required this.id,
    required this.title,
    required this.details ,
    required this.isPinned,
    this.creationDate,
    required this.groupId,
    this.group,
    required this.userId,
    this.user,
    this.images
  });

  int id;
  String title ;
  String details ;
  bool isPinned ;
  String? creationDate ;
  int groupId;
  Group? group;
  int userId;
  User? user;
  List<TopicImage>? images;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"],
    title: json["title"],
    details: json["details"],
    isPinned: json["isPinned"],
    creationDate: json["creationDate"],
    groupId: json["groupId"],
    group: json["group"] != null ? Group.fromJson(json["group"]) : null,
    userId: json["userId"],
    user: json["user"] != null ? User.fromJson(json["user"]) : null,
    images: json["images"] != null ? List<TopicImage>.from(json["images"].map((x) => TopicImage.fromJsonOnlyIDs(x))) : null,

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'details': details,
    'isPinned': isPinned,
    'creationDate': creationDate,
    'groupId': groupId,
    'group': group,
    'userId': userId,
    'user': user,
  };
}


