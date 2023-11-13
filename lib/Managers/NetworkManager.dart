import 'dart:convert';
import 'dart:io';

import '../Helper/Constants.dart';
import '../Models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkManager {

  Future<T> getRequest<T>({
    required String endpoint,
    required dynamic body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final Uri uri = Uri.parse('${Constant.baseURL}$endpoint');
    print(uri);

    try {
      final response = await http.get(
        uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        return fromJson(responseBody);
      } else {

        throw Exception('Failed to make the request ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}