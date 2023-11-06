import 'dart:convert';

import 'Topic.dart';
import 'User.dart';

class TopicLike {
  TopicLike({
    required this.id,
    required this.topicId,
    this.topic,
    required this.userId,
    this.user,
  });

  int id;
  int topicId;
  Topic? topic;
  int userId;
  User? user;

  factory TopicLike.fromJson(Map<String, dynamic> json) => TopicLike(
    id: json["id"],
    topicId: json["topicId"],
    topic: json["topic"] != null ? Topic.fromJson(json["topic"]) : null,
    userId: json["userId"],
    user: json["user"] != null ? User.fromJson(json["user"]) : null,

  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'topicId': topicId,
    'topic': topic,
    'userId': userId,
    'user': user,
  };
}


