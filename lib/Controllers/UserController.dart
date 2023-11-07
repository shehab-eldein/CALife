
import 'dart:convert';

import '../Helper/Constants.dart';
import '../Models/User.dart';
import 'package:http/http.dart' as http;

class UserController {

  Future<User?> signUp(String fullName,String displayName,String email,String password,String phone,String userImage) async {
    User user=new User(displayName: displayName, fullName: fullName, email: email, password: password,phone:phone,id: 0,deviceToken: '',lastLoginDate: '2023-01-01',registerationDate: '2023-01-01',userType: UserData.userType,isActive: true,userImage: userImage );
    final url = "${Constant.baseURL}${Constant.user}AddUser";

    print(jsonEncode(user.toJson()));
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      print("sign up Succ in Manager");
      final jsonResponse = jsonDecode(response.body);
      User user = User.fromJson(jsonResponse);

      print(user.toJson());
      return user;
    } else {
      print("sign up Falied in Manager ${response.statusCode} ");
      return null;
    }
  }

  Future<User?> login(String userName, String password) async {
    //todo but urls in constant
    final loginUrl =
        "${Constant.baseURL}/${Constant.user}LoginByUserPassword";

    var urlConverted=Uri.parse(loginUrl).replace(queryParameters: {
      'userName': userName,
      'password': password,
    });
    final response = await http.get(urlConverted, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      print("Login Succ in Manager");

      final jsonResponse = jsonDecode(response.body);
      //print(jsonResponse);
      User user = User.fromJson(jsonResponse);
      //print(user.name);
      return user;
      // Do something with the response
    } else {
      print("Login Falied in Manager ${response.statusCode} ");
      //throw Exception('Failed to login');
      return null;
    }
  }


  Future<User?> loginByGoogle(String userName) async {
    //todo but urls in constant
    final loginUrl =
        "${Constant.baseURL}/${Constant.user}LoginByGoogle";

    var urlConverted=Uri.parse(loginUrl).replace(queryParameters: {
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