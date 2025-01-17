import 'User.dart';

class Group {
  Group({
    required this.id,
    required this.name,
    required this.groupType,
    required this.locationX,
    required this.locationY,
    required this.visibility,
    this.creationDate,
    this.groupImage,
    this.groupCoverImage,
    this.subscribersNo,
    this.topicsNo,
    required this.userId,
    this.user,
    this.guide,
    this.description,
  });
  int id;
  String name;
  int groupType;
  num locationX;
  num locationY;
  int visibility;
  String? creationDate;
  String? groupImage;
  String? groupCoverImage;
  int? subscribersNo;
  int? topicsNo;
  int userId;
  User? user;
  String? guide;
  String? description;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        groupType: json["groupType"],
        locationX: json["locationX"],
        locationY: json["locationY"],
        visibility: json["visibility"],
        creationDate: json["creationDate"],
        groupImage: json["groupImage"],
        groupCoverImage: json["groupCoverImage"],
        subscribersNo: json["subscribersNo"],
        topicsNo: json["topicsNo"],
        userId: json["userId"],
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
        guide: json["guide"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'groupType': groupType,
        'locationX': locationX,
        'locationY': locationY,
        'visibility': visibility,
        'creationDate': creationDate,
        'groupImage': groupImage,
        'groupCoverImage': groupCoverImage,
        'subscribersNo': subscribersNo,
        'topicsNo': topicsNo,
        'userId': userId,
        'user': user,
        'guide': guide,
        'description': description,
      };
}
