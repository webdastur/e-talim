import 'dart:convert';

import 'package:e_talim/core/models/category/category.dart';
import 'package:e_talim/core/models/course/course.dart';
import 'package:e_talim/core/utils/api_utils.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<String?> signIn({
    required String username,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        APIUtils.signIn,
        body: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['access_token'];
      }
      return null;
    } catch (e) {
      print("Error: ${e.toString()}");
      return null;
    }
  }

  Future<Course?> getCourses(String token) async {
    try {
      http.Response response = await http.get(
        APIUtils.courses,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return Course.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      print("Error: ${e.toString()}");
      return null;
    }
  }

  Future<Category?> getCategories(String token) async {
    try {
      http.Response response = await http.get(
        APIUtils.categories,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return Category.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      print("Error: ${e.toString()}");
      return null;
    }
  }
}
