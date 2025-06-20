import 'dart:convert';

class UserLoginModel {
  final String loginId;
  final String password;

  UserLoginModel({required this.loginId, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'LoginId': loginId, 'Password': password};
  }

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      loginId: map['LoginId'] as String,
      password: map['Password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginModel.fromJson(String source) =>
      UserLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
