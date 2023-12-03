import 'dart:convert';
import '../Helper/Constants.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  Future<T> getRequest<T>({
    required String endpoint,
    required dynamic body,
    required T Function(dynamic) fromJson,
  }) async {
    final Uri uri = Uri.parse('${Constant.baseURL}$endpoint');
    print(uri);

    try {
      final response = await http.get(uri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (response.statusCode == 200) {
        final dynamic responseBody = json.decode(response.body);
        return fromJson(responseBody);
      } else {
        throw Exception('Failed to make the request ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<T> postRequest<T>({
    required String endpoint,
    required dynamic body,
    required T Function(dynamic) fromJson,
  }) async {
    final Uri uri = Uri.parse('${Constant.baseURL}$endpoint');
    print(uri);

    try {
      final response = await http.post(
        uri,
        body: json.encode(body),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseBody = json.decode(response.body);
        return fromJson(responseBody);
      } else {
        throw Exception('Failed to make the request ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
