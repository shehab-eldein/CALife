import 'dart:convert';

import '../Helper/Constants.dart';
import '../Managers/NetworkManager.dart';
import '../Models/User.dart';
import 'package:http/http.dart' as http;

class AuthenticationController {
  final _networkManager = NetworkManager();

  Future<User?> login(String userName, String password) async {
    try {
      final User user = await _networkManager.getRequest(
        endpoint:
            '${Constant.user}LoginByUserPassword?userName=$userName&password=$password',
        body: null,
        fromJson: (json) => User.fromJson(json),
      );

      print('User ID: ${user.id}, Username: ${user.phone}');
      return user;
    } catch (e) {
      //print('Error: $e');
      return null;
    }
  }

  Future<User?> signUP(String fullName, String displayName, String email,
      String password, String phone, String userImage) async {
    User userBody = User(
        displayName: displayName,
        fullName: fullName,
        email: email,
        password: password,
        phone: phone,
        id: 0,
        deviceToken: '',
        lastLoginDate: '2023-01-01',
        registerationDate: '2023-01-01',
        userType: UserData.isInCanada == true ? 0 : 1,
        isActive: true,
        userImage: userImage);

    print(userBody.toJson());
    try {
      final User user = await _networkManager.postRequest(
        endpoint: '${Constant.user}AddUser',
        body: userBody.toJson(),
        fromJson: (json) => User.fromJson(json),
      );

      print('User ID: ${user.id}, Username: ${user.fullName}');
      return user;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<User?> loginByGoogle(String userName) async {
    //todo but urls in constant
    final loginUrl = "${Constant.baseURL}/${Constant.user}LoginByGoogle";

    var urlConverted = Uri.parse(loginUrl).replace(queryParameters: {
      'userName': userName,
    });
    final response = await http.get(urlConverted, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      print("Login Succ in Manager");

      final jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse);
      return user;
    } else {
      print("Login Falied in Manager ${response.statusCode} ");
      return null;
    }
  }
}
