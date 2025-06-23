import 'dart:convert';

class UserLoginModel {
  final String identifier;
  final String password;

  UserLoginModel({required this.identifier, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'identifier': identifier, 'password': password};
  }

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      identifier: map['identifier'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginModel.fromJson(String source) =>
      UserLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
