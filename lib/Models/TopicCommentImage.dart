import 'package:canadianslife/Models/TopicComment.dart';

class TopicCommentImage {
  TopicCommentImage({
    required this.id,
    this.commentImage,
    required this.commentId,
    this.comment,
  });

  int id;
  String? commentImage;
  int commentId;
  TopicComment? comment;

  factory TopicCommentImage.fromJson(Map<String, dynamic> json) =>
      TopicCommentImage(
        id: json["id"],
        commentImage: json["commentImage"],
        commentId: json["commentId"],
        comment: json["comment"] != null
            ? TopicComment.fromJson(json["comment"])
            : null,
      );

  factory TopicCommentImage.fromJsonOnlyIDs(Map<String, dynamic> json) =>
      TopicCommentImage(
        id: json["id"],
        commentId: 0,
        comment: null,
        commentImage: "",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'topicImage': commentImage,
        'topicId': commentId,
        'topic': comment,
      };
}
