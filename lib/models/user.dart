class User{
  final String name;
  final String email;
  final String? password;
  final String phoneNumber;
  final String roleType;
  final String address;
  User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.password,
    required this.roleType,
    required this.address

  });
  
}