import 'package:get_storage/get_storage.dart';

class ManageStorage {
  final storage = GetStorage();

  void login() {
    storage.write("login", true);
  }

  void loginOut() {
    storage.write("login", false);
  }

  void saveUser(
      {required String username,
      required String email,
      required String phone}) {
    storage.write('username', username);
    storage.write('email', email);
    storage.write('phone', phone);
  }

  Map<String, String> readUser() {
    return {
      "username": storage.read("username"),
      "email": storage.read("email"),
      "phone": storage.read("phone")
    };
  }
}
