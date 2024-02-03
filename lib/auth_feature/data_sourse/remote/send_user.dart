import 'package:http/http.dart' as http;
import 'package:user_valid/auth_feature/data_sourse/model/model-send-user.dart';

class ApiProvider {
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

  Future<bool> checkUser(
      {required String username, required String password}) async {
    try {
      var response = await http.post(
        Uri.https("userinfo.liara.run", "/checkUser"),
        body: {"username": username, "password": password},
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
}
