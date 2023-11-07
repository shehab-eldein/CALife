import 'dart:convert';

import 'package:canadianslife/Models/GroupSubscriber.dart';

import '../Helper/Constants.dart';
import '../Models/Group.dart';
import 'package:http/http.dart' as http;

class GroupController
{
  Future<List<Group>> getSubscribedGroups(int userId,String searchWord) async{
    final finalUri = Uri.parse( "${Constant.baseURL}/${Constant.group}GetSubscribedGroups").replace(queryParameters: {
      'userID': userId,
      'searchWord': searchWord

    });
    final response =
        await http.get(finalUri);

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

  Future<List<Group>> getUnsubscribedGroups(int groupType,int userId,String searchWord) async{

    final finalUri = Uri.parse( "${Constant.baseURL}/${Constant.group}GetUnsubscriberGroups").replace(queryParameters: {
      'userID': userId,
      'searchWord': searchWord,
      'groupType':groupType
    });
    final response =
    await http.get(finalUri);
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


  Future<List<Group>> getMyGroups(int userId) async{
    final finalUri = Uri.parse( "${Constant.baseURL}/${Constant.group}GetMyGroups").replace(queryParameters: {
      'userID': userId,

    });
    final response =
    await http.get(finalUri);

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

  Future<List<GroupSubscriber>> getGroupPendingRequests(int groupId) async{
    final finalUri = Uri.parse( "${Constant.baseURL}/${Constant.group}GetGroupSubscribersByGroupIdAndStatus").replace(queryParameters: {
      'groupId': groupId,
      'groupSubscribeStatus': 0

    });
    final response =
    await http.get(finalUri);

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

  Future<List<GroupSubscriber>> getGroupSubscribers(int groupId) async{
    final finalUri = Uri.parse( "${Constant.baseURL}/${Constant.group}GetGroupSubscribersByGroupIdAndStatus").replace(queryParameters: {
      'groupId': groupId,
      'groupSubscribeStatus': 1

    });
    final response =
    await http.get(finalUri);

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

  Future<bool> subscribeToGroup(int groupId,int userId) async {
    GroupSubscriber subscriber=new GroupSubscriber(id: 0, groupId: groupId, userId: userId, joinDate: '2023-01-01', requestDate: '2023-01-01', subscriberStatus: 0,group: null,user: null);
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


  Future<bool> createGroup(String name,int groupType,int visibility,int creatorUserId,String groupImage) async {
    Group subscriber=new Group(id: 0, name: name, groupType: groupType, locationX: 0, locationY: 0, visibility: visibility, userId: creatorUserId,groupImage: groupImage,creationDate: '2023-01-01',subscribersCount: 0,user: null);
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

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({

        'groupSubscriberId':groupSubscriberId,

      }
    )
    );

    if (response.statusCode == 200) {
      print("Success");
      return true;
    } else {
      print("Falied ${response.statusCode} ");
      return false;
    }
  }


}