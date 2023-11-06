import 'dart:convert';

import '../Helper/Constants.dart';
import '../Models/Group.dart';
import 'package:http/http.dart' as http;

class GroupController
{
  Future<List<Group>> GetSubscribedGroups(int userId) async{

    final response =
        await http.get(Uri.parse( "${Constant.baseURL}/${Constant.group}GetSubscribedGroups?userID=${userId}"));
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

  Future<List<Group>> GetUnsubscribedGroups(int groupType,int userId) async{

    final response =
    await http.get(Uri.parse( "${Constant.baseURL}/${Constant.group}GetUnsubscriberGroups?groupType=${groupType}&userID=${userId}"));
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
}