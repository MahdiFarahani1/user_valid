import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_valid/auth_feature/data_sourse/model/model-send-user.dart';

class ApiProvider {
  static final ApiProvider _instance = ApiProvider._internal();
  factory ApiProvider() => _instance;
  ApiProvider._internal();

  Future<bool> sendUser(User user) async {
    try {
      var response = await http.post(
        Uri.https("userinfo.liara.run", "/add-user"),
        body: user.toJson(),
      );
      if (response.statusCode == 200) {
        print(response.body);

        return true;
      } else {
        print(response.body);

        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<User?> checkUser(
      {required String username, required String password}) async {
    try {
      var response = await http.post(
        Uri.https("userinfo.liara.run", "/checkUser"),
        body: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        // Assuming the API returns a JSON object for the user
        Map<String, dynamic> responseBody = json.decode(response.body);

        User user = User(
          username: responseBody['username'],
          password: responseBody['password'],
          phone: responseBody['phone'],
          email: responseBody['email'],
        );

        print(response.body);

        return user;
      } else {
        print(response.body);

        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
