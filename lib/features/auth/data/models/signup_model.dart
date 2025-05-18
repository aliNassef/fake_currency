class SignupModel {
  final String accessToken;
  final String email;
  final String name;

  const SignupModel({
    required this.accessToken,
    required this.email,
    required this.name,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    accessToken: json["accessToken"],
    email: json["email"],
    name: json["name"],
  );
}
