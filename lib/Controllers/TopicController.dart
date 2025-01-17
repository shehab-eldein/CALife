import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/NetworkManager.dart';
import 'package:canadianslife/Models/TopicComment.dart';
import 'package:canadianslife/Models/TopicImage.dart';

import '../Models/Topic.dart';

class TopicController {
  final _networkManager = NetworkManager();

  Future<Topic?> topicAdd(
      int groupId, String title, String details, int userId) async {
    try {
      Topic topic = await _networkManager.postRequest(
        endpoint: '${Constant.topic}TopicAdd',
        body: Topic(
          id: 0,
          title: title,
          details: details,
          isPinned: true,
          groupId: groupId,
          userId: userId,
        ).toJson(),
        fromJson: (json) => Topic.fromJson(json),
      );
      print('Topic ${topic.id} Created');
      return topic;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> topicUpdate(
      int id, String title, String details, int userId) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint: '${Constant.topic}TopicUpdate',
        body: {
          "id": id,
          "title": title,
          "details": details,
          "userId": userId,
          "isPinned": true,
          "images": [
            {"id": 0, "topicId": 0, "topicImage": "string"}
          ]
        },
        fromJson: (json) => (json),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> topicDelete(int topicId) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint: '${Constant.topic}TopicDelete?topicId=$topicId',
        body: null,
        fromJson: (json) => (json),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Topic>> topicsGetByGroupId(
      int groupId, int userId, String searchQuery, int loadingId) async {
    try {
      List<Topic> topics = await _networkManager.getRequest(
        endpoint:
            '${Constant.topic}TopicsGetByGroupId?groupId=$groupId&userId=$userId&searchQuery=$searchQuery&loadingId=$loadingId',
        body: null,
        fromJson: (json) => List<Topic>.from(
          json.map(
            (item) => Topic.fromJson(item),
          ),
        ),
      );
      print(topics.toString());
      return topics;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Topic>> topicsGetAdilAwdah(
      int groupType, int userId, int loadingId) async {
    try {
      List<Topic> topics = await _networkManager.getRequest(
        endpoint:
            '${Constant.topic}TopicsGetAdilAwdah?groupType=$groupType&userId=$userId&loadingId=$loadingId',
        body: null,
        fromJson: (json) => List<Topic>.from(
          json.map(
            (item) => Topic.fromJson(item),
          ),
        ),
      );
      print(topics.toString());
      return topics;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Topic>> topicsGetByTimeLine(
      int userId, String searchQuery, int loadingId) async {
    try {
      List<Topic> topics = await _networkManager.getRequest(
        endpoint:
            '${Constant.topic}topicsGetByTimeLine?userId=$userId&searchQuery=$searchQuery&loadingId=$loadingId',
        body: null,
        fromJson: (json) => List<Topic>.from(
          json.map(
            (item) => Topic.fromJson(item),
          ),
        ),
      );
      print(topics.toString());
      return topics;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Topic>> topicsGetByUserId(
      int userId, String searchQuery, int loadingId) async {
    try {
      List<Topic> topics = await _networkManager.getRequest(
        endpoint:
            '${Constant.topic}TopicsGetByUserId?userId=$userId&searchQuery=$searchQuery&loadingId=$loadingId',
        body: null,
        fromJson: (json) => List<Topic>.from(
          json.map(
            (item) => Topic.fromJson(item),
          ),
        ),
      );
      print(topics.toString());
      return topics;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> topicLikeAdd(int topicId, int userId) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint: '${Constant.topic}TopicLikeAdd',
        body: {
          "id": 0,
          "userId": userId,
          "topicId": topicId,
        },
        fromJson: (json) => (json),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> topicImageAdd(int topicId, String image) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint: '${Constant.topic}TopicImageAdd',
        body: TopicImage(id: 0, topicId: topicId, topicImage: image),
        fromJson: (json) => (json),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<TopicImage>> topicImagesGetByTopicId(int topicId) async {
    try {
      List<TopicImage> res = await _networkManager.getRequest(
        endpoint: '${Constant.topic}TopicImagesGetByTopicId?topicId=$topicId',
        body: null,
        fromJson: (json) => List<TopicImage>.from(
          json.map(
            (item) => TopicImage.fromJson(item),
          ),
        ),
      );
      print(res.toList());
      return res;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> topicImageDelete(int topicImageId, int userId) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint:
            '${Constant.topic}TopicImageDelete?topicImageId=$topicImageId',
        body: null,
        fromJson: (json) => (json),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> topicLikeDelete(int topicId, int userId) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint:
            '${Constant.topic}TopicLikeDelete?topicId=$topicId&userId=$userId',
        body: null,
        fromJson: (json) => (json),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List?> topicLikesGetByTopicId(int topicId) async {
    try {
      List res = await _networkManager.getRequest(
        endpoint: '${Constant.topic}TopicLikesGetByTopicId?topicId=$topicId',
        body: null,
        fromJson: (json) => (json),
      );
      print(res.toList());
      return res;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> topicCommentAdd(String comment, int topicId, int userId) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint: '${Constant.topic}TopicCommentAdd',
        body: {
          "id": 0,
          "userId": userId,
          "topicId": topicId,
          "commentDetails": comment,
          "images": [
            {"id": 0, "commentId": 0, "commentImage": "string"}
          ]
        },
        fromJson: (json) => (json),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> topicCommentDelete(int commentId) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint:
            '${Constant.topic}TopicCommentDelete?TopicCommentId=$commentId',
        body: null,
        fromJson: (json) => (json),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<TopicComment>> topicCommentsGetByTopicId(
      int topicId, int loadingId) async {
    try {
      List<TopicComment> res = await _networkManager.getRequest(
        endpoint:
            '${Constant.topic}TopicCommentsGetByTopicId?topicId=$topicId&loadingId=$loadingId',
        body: null,
        fromJson: (json) => List<TopicComment>.from(
          json.map(
            (item) => TopicComment.fromJson(item),
          ),
        ),
      );
      print(res);
      return res;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<TopicComment>> topicCommentsGetByUserId(int userId) async {
    try {
      List<TopicComment> res = await _networkManager.getRequest(
        endpoint: '${Constant.topic}TopicCommentsGetByUserId?userId=$userId',
        body: null,
        fromJson: (json) => List<TopicComment>.from(
          json.map(
            (item) => TopicComment.fromJson(item),
          ),
        ),
      );
      print(res.toList());
      return res;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
