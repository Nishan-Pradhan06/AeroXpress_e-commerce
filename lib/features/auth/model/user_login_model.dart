import 'dart:convert';

class UserLoginModel {
  final String email;
  final String password;

  UserLoginModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password};
  }

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginModel.fromJson(String source) =>
      UserLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
