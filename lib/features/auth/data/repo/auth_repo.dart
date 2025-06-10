import 'package:dartz/dartz.dart';
import 'package:fake_currency/core/networking/failure.dart';
import 'package:fake_currency/features/auth/data/models/login_input_model.dart';

import '../models/forget_pass_model.dart';
import '../models/login_model.dart';
import '../models/signup_input_model.dart';
import '../models/signup_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignupModel>> signup(SignupInputModel input);
  Future<Either<Failure, LoginModel>> login(LoginInputModel input);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, ForgetPassModel>> forgetPass(String email);
  Future<Either<Failure, void>> verifyCode(String code, String token);
  Future<Either<Failure, void>> resetPassword(String password, String token);
}
