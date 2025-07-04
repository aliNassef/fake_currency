class SignupInputModel {
  final String email;
  final String name;
  final String password;

  const SignupInputModel({
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
  };
}
