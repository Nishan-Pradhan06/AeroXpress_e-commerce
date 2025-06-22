class CustomerRegisterModel {
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String phone;

  CustomerRegisterModel({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
    };
  }
}
