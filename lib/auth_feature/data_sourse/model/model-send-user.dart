class User {
  String username;
  String password;
  int phone;
  String email;

  User({
    required this.username,
    required this.password,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'phone': phone,
      'email': email,
    };
  }
}
