import 'Topic.dart';
import 'TopicCommentImage.dart';
import 'User.dart';

class TopicComment {
  TopicComment(
      {required this.id,
      required this.topicId,
      this.topic,
      required this.userId,
      this.user,
      required this.commentDetails,
      this.creationDate,
      this.images});

  int id;
  int topicId;
  Topic? topic;
  int userId;
  User? user;
  String commentDetails;
  String? creationDate;
  List<TopicCommentImage>? images;

  factory TopicComment.fromJson(Map<String, dynamic> json) => TopicComment(
        id: json["id"],
        topicId: json["topicId"],
        topic: json["topic"] != null ? Topic.fromJson(json["topic"]) : null,
        userId: json["userId"],
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
        commentDetails: json["commentDetails"],
        creationDate: json["creationDate"],
        images: json["images"] != null
            ? List<TopicCommentImage>.from(
                json["images"].map((x) => TopicCommentImage.fromJsonOnlyIDs(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'topicId': topicId,
        'topic': topic,
        'userId': userId,
        'user': user,
        'commentDetails': commentDetails,
        'creationDate': creationDate,
        'images': images,
      };
}
