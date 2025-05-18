class LoginModel {
  final String accessToken;
  final String email;

  const LoginModel({required this.accessToken, required this.email});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(accessToken: json["accessToken"], email: json["email"]);
}
