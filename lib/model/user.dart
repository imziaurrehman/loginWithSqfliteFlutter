class User {
  String? email;
  String? password;

  User({this.email, this.password});

  User.fromMap(Map<String, dynamic> map) {
    email = map["email"];
    password = map["password"];
  }

  Map<String, Object> toMap() {
    return {
      "email": email!,
      "password": password!,
    };
  }
}
