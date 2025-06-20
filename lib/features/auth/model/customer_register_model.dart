
class CustomerRegisterModel {
  final String userName;
  final String phoneNumber;
  final String email;
  final String userType;
  final String gender;
  final String userAddress;
  CustomerRegisterModel({
    required this.userName,
    required this.phoneNumber,
    required this.email,
    this.userType = "Customer",
    required this.gender,
    required this.userAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'phoneNo': phoneNumber,
      'emailAddress': email,
      'userType': userType,
      'gender': gender,
      'UserAddress': userAddress,
    };
  }
}
