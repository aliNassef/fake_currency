class ForgetPassModel {
final bool success;
final String message;
final String token;

const ForgetPassModel({required this.success, required this.message, required this.token});
  factory ForgetPassModel.fromJson(Map<String, dynamic> json) => ForgetPassModel(
    success: json["success"],
    message: json["message"],
    token: json["token"],
  );
}

 