import 'dart:convert';

import 'Topic.dart';
import 'User.dart';

class TopicImage {
  TopicImage({
    required this.id,
    this.topicImage,
    required this.topicId,
    this.topic,
  });

  int id;
  String? topicImage;
  int topicId;
  Topic? topic;

  factory TopicImage.fromJson(Map<String, dynamic> json) => TopicImage(
    id: json["id"],
    topicImage: json["topicImage"],
    topicId: json["topicId"],
    topic: json["topic"] != null ? Topic.fromJson(json["topic"]) : null,

  );

  factory TopicImage.fromJsonOnlyIDs(Map<String, dynamic> json) => TopicImage(
    id: json["id"],
    topicId: 0,
    topic: null,
    topicImage: "",

  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'topicImage': topicImage,
    'topicId': topicId,
    'topic': topic,
  };
}


