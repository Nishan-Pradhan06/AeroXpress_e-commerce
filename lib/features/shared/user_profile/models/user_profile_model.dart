class UserProfileModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phone;
  final String role;
  final String? avatar;
  final DateTime? createdAt;

  UserProfileModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    required this.role,
    this.avatar,
    this.createdAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      role: json['role'],
      avatar: json['avatar'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }
}
