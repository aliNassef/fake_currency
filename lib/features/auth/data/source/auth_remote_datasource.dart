import 'package:fake_currency/core/networking/api_consumer.dart';
import 'package:fake_currency/core/networking/endpoints.dart';
import 'package:fake_currency/core/networking/exceptions.dart';
import 'package:fake_currency/features/auth/data/models/login_input_model.dart';
import 'package:fake_currency/features/auth/data/models/login_model.dart';
import 'package:fake_currency/features/auth/data/models/signup_input_model.dart';
import 'package:fake_currency/features/auth/data/models/signup_model.dart';

import '../../../../core/networking/error_model.dart';
import '../models/forget_pass_model.dart';

abstract class AuthRemoteDatasource {
  Future<SignupModel> signup(SignupInputModel input);
  Future<LoginModel> login(LoginInputModel input);
  Future<ForgetPassModel> forgetPass(String email);
  Future<void> verifyCode(String code, String token);
  Future<void> resetPassword(String password, String token);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiService _apiService;

  AuthRemoteDatasourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<SignupModel> signup(SignupInputModel input) async {
    final response = await _apiService.post(
      EndPoints.register,
      data: input.toJson(),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignupModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<LoginModel> login(LoginInputModel input) async {
    final response = await _apiService.post(
      EndPoints.login,
      data: input.toJson(),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<ForgetPassModel> forgetPass(String email) async {
    final response = await _apiService.post(
      EndPoints.forgetPass,
      data: {"email": email},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ForgetPassModel.fromJson(response.data);
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<void> verifyCode(String code, String token) async {
    final response = await _apiService.post(
      EndPoints.verifyCode,
      data: {"code": code, "token": token},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<void> resetPassword(String password, String token) async {
    final response = await _apiService.post(
      '${EndPoints.resetPass}$token',
      data: {"password": password},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      throw ServerException(ErrorModel.fromJson(response.data));
    }
  }
}
