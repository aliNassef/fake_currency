class LoginInputModel {
  final String email;
  final String password;

 const LoginInputModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}