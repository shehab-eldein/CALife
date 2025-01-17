import 'dart:convert';

import 'package:canadianslife/Managers/NetworkManager.dart';
import 'package:canadianslife/Models/GroupSubscriber.dart';

import '../Helper/Constants.dart';
import '../Models/Group.dart';
import 'package:http/http.dart' as http;

class GroupController {
  final _networkManager = NetworkManager();

  Future<List<Group>> getUnsubedGroups(
      int type, int userId, String searchWord, int loadingId) async {
    try {
      final res = await _networkManager.getRequest(
        endpoint:
            '${Constant.group}GetUnsubscribedGroups?groupsType=$type&userID=$userId&searchWord=$searchWord&loadingId=$loadingId',
        body: null,
        fromJson: (json) => json,
      );
      final List<dynamic> data = res;
      print(data.toString());
      final List<Group> groups =
          data.map((item) => Group.fromJson(item)).toList();
      return groups;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Group>> getSubedGroups(
      int userId, String searchWord, int loadingId) async {
    try {
      final res = await _networkManager.getRequest(
        endpoint:
            '${Constant.group}GetSubscribedGroups?userID=$userId&searchWord=$searchWord&loadingId=$loadingId',
        body: null,
        fromJson: (json) => json,
      );
      final List<dynamic> data = res;
      print(data.toString());
      final List<Group> groups =
          data.map((item) => Group.fromJson(item)).toList();
      return groups;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Group>> getUserGroups(int userId) async {
    try {
      final res = await _networkManager.getRequest(
        endpoint: '${Constant.group}GetMyGroups?userID=$userId',
        body: null,
        fromJson: (json) => json,
      );
      final List<dynamic> data = res;
      print(data.toString());
      final List<Group> groups =
          data.map((item) => Group.fromJson(item)).toList();
      return groups;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<GroupSubscriber>> getGroupSubscribersByIdAndStatus(
      int groupId, int groupSubscribeStatus) async {
    try {
      final res = await _networkManager.getRequest(
        endpoint:
            '${Constant.group}GetGroupSubscribersByGroupIdAndStatus?groupId=$groupId&groupSubscribeStatus=$groupSubscribeStatus',
        body: null,
        fromJson: (json) => json,
      );
      final List<dynamic> data = res;
      print(data.toString());
      final List<GroupSubscriber> groups =
          data.map((item) => GroupSubscriber.fromJson(item)).toList();
      return groups;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> approveGroupSubRequest(int groupSubscriberId) async {
    try {
      final res = await _networkManager.postRequest(
        endpoint:
            '${Constant.group}ApproveGroupSubscriber?groupSubscriberId=$groupSubscriberId',
        body: null,
        fromJson: (json) => json,
      );
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> rejectGroupSubRequest(int groupSubscriberId) async {
    try {
      final res = await _networkManager.postRequest(
        endpoint:
            '${Constant.group}DeleteGroupSubscriber?groupSubscriberId=$groupSubscriberId',
        body: null,
        fromJson: (json) => json,
      );
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> removeUserFromGroup(int groupId, int userId) async {
    try {
      final res = await _networkManager.postRequest(
        endpoint: '${Constant.group}ExitGroup?groupId=$groupId&userId=$userId',
        body: null,
        fromJson: (json) => json,
      );
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> blockUserFromGroup(int groupId, int userId) async {
    try {
      final res = await _networkManager.postRequest(
        endpoint: '${Constant.group}BlockUser?groupId=$groupId&userId=$userId',
        body: null,
        fromJson: (json) => json,
      );
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // ----old----

  Future<List<Group>> getSubscribedGroups(int userId, String searchWord) async {
    final finalUri =
        Uri.parse("${Constant.baseURL}/${Constant.group}GetSubscribedGroups")
            .replace(
                queryParameters: {'userID': userId, 'searchWord': searchWord});
    final response = await http.get(finalUri);

    if (response.statusCode == 200) {
      print("Succ");
      print(response.body);
    } else {
      print(response.statusCode);
    }
    final List<dynamic> data = jsonDecode(response.body);
    final List<Group> groups =
        data.map((item) => Group.fromJson(item)).toList();

    print("hello");
    return groups;
  }

  Future<List<Group>> getUnsubscribedGroups(
      int groupType, int userId, String searchWord) async {
    final finalUri =
        Uri.parse("${Constant.baseURL}/${Constant.group}GetUnsubscriberGroups")
            .replace(queryParameters: {
      'userID': userId,
      'searchWord': searchWord,
      'groupType': groupType
    });
    final response = await http.get(finalUri);
    if (response.statusCode == 200) {
      print("Succ");
      print(response.body);
    } else {
      print(response.statusCode);
    }
    final List<dynamic> data = jsonDecode(response.body);
    final List<Group> groups =
        data.map((item) => Group.fromJson(item)).toList();

    print("hello");
    return groups;
  }

  Future<List<Group>> getMyGroups(int userId) async {
    final finalUri =
        Uri.parse("${Constant.baseURL}/${Constant.group}GetMyGroups")
            .replace(queryParameters: {
      'userID': userId,
    });
    final response = await http.get(finalUri);

    if (response.statusCode == 200) {
      print("Succ");
      print(response.body);
    } else {
      print(response.statusCode);
    }
    final List<dynamic> data = jsonDecode(response.body);
    final List<Group> groups =
        data.map((item) => Group.fromJson(item)).toList();

    print("hello");
    return groups;
  }

  Future<List<GroupSubscriber>> getGroupPendingRequests(int groupId) async {
    final finalUri = Uri.parse(
            "${Constant.baseURL}/${Constant.group}GetGroupSubscribersByGroupIdAndStatus")
        .replace(
            queryParameters: {'groupId': groupId, 'groupSubscribeStatus': 0});
    final response = await http.get(finalUri);

    if (response.statusCode == 200) {
      print("Succ");
      print(response.body);
    } else {
      print(response.statusCode);
    }
    final List<dynamic> data = jsonDecode(response.body);
    final List<GroupSubscriber> groups =
        data.map((item) => GroupSubscriber.fromJson(item)).toList();

    print("hello");
    return groups;
  }

  Future<List<GroupSubscriber>> getGroupSubscribers(int groupId) async {
    final finalUri = Uri.parse(
            "${Constant.baseURL}/${Constant.group}GetGroupSubscribersByGroupIdAndStatus")
        .replace(
            queryParameters: {'groupId': groupId, 'groupSubscribeStatus': 1});
    final response = await http.get(finalUri);

    if (response.statusCode == 200) {
      print("Succ");
      print(response.body);
    } else {
      print(response.statusCode);
    }
    final List<dynamic> data = jsonDecode(response.body);
    final List<GroupSubscriber> groups =
        data.map((item) => GroupSubscriber.fromJson(item)).toList();

    print("hello");
    return groups;
  }

  Future<bool> subscribeToGroup(int groupId, int userId) async {
    GroupSubscriber subscriber = GroupSubscriber(
        id: 0,
        groupId: groupId,
        userId: userId,
        joinDate: '2023-01-01',
        requestDate: '2023-01-01',
        subscriberStatus: 0,
        group: null,
        user: null);
    final url = "${Constant.baseURL}${Constant.group}AddGroupSubscriber";

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(subscriber.toJson()),
    );

    if (response.statusCode == 200) {
      print("Success");
      return true;
    } else {
      print("Falied ${response.statusCode} ");
      return false;
    }
  }

  Future<bool> createGroup(
      String name,
      int groupType,
      int visibility,
      String description,
      String guide,
      int creatorUserId,
      String groupCoverImage) async {
    Group subscriber = Group(
      id: 0,
      name: name,
      groupType: groupType,
      locationX: 0,
      locationY: 0,
      visibility: visibility,
      userId: creatorUserId,
      groupImage: groupCoverImage,
      groupCoverImage: groupCoverImage,
      creationDate: '2023-01-01',
      subscribersNo: 0,
      topicsNo: 0,
      user: null,
      guide: guide,
      description: description,
    );
    final url = "${Constant.baseURL}${Constant.group}AddGroup";

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(subscriber.toJson()),
    );

    if (response.statusCode == 200) {
      print("Success");
      return true;
    } else {
      print("Falied ${response.statusCode} ");
      return false;
    }
  }

  Future<bool> approveGroupSubscriber(int groupSubscriberId) async {
    final url = "${Constant.baseURL}${Constant.group}ApproveGroupSubscriber";

    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'groupSubscriberId': groupSubscriberId,
        }));

    if (response.statusCode == 200) {
      print("Success");
      return true;
    } else {
      print("Falied ${response.statusCode} ");
      return false;
    }
  }
}
