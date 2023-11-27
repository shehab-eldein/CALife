import 'package:canadianslife/Helper/Constants.dart';
import 'package:canadianslife/Managers/NetworkManager.dart';
import 'package:canadianslife/Models/TopicComment.dart';

import '../Models/Topic.dart';

class TopicController {
  final _networkManager = NetworkManager();

  Future<Topic?> topicAdd(int groupId, String title, String details) async {
    try {
      Topic topic = await _networkManager.postRequest(
        endpoint: '${Constant.topic}TopicAdd',
        body: {
          "id": 0,
          "title": title,
          "details": details,
          "userId": Constant.currentUserId,
          "groupId": groupId,
          "isPinned": true,
          "images": [
            {"id": 0, "topicId": 0, "topicImage": "string"}
          ]
        },
        fromJson: (json) => Topic.fromJson(json),
      );
      print(topic.toString());
      return topic;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> topicUpdate(int id, String title, String details) async {
    try {
      bool res = await _networkManager.postRequest(
        endpoint: '${Constant.topic}TopicUpdate',
        body: {
          "id": id,
          "title": title,
          "details": details,
          "userId": Constant.currentUserId,
          "groupId": 2,
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

  Future<List<Topic>?> topicsGetByGroupId(int groupId, int loadingId) async {
    try {
      List<Topic> topics = await _networkManager.getRequest(
        endpoint:
            '${Constant.topic}TopicsGetByGroupId?groupId=$groupId&loadingId=$loadingId',
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
      return null;
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

  Future<List<TopicComment>?> topicCommentsGetByTopicId(
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
      return null;
    }
  }

  Future<List<TopicComment>?> topicCommentsGetByUserId(int userId) async {
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
      return null;
    }
  }
}
