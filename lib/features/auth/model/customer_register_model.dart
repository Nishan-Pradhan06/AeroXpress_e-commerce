class CustomerRegisterModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;

  CustomerRegisterModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
    };
  }
}
