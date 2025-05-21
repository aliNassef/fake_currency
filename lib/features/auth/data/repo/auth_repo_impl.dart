import 'package:dartz/dartz.dart';
import 'package:fake_currency/core/networking/exceptions.dart';
import 'package:fake_currency/core/networking/failure.dart';
import 'package:fake_currency/features/auth/data/models/forget_pass_model.dart';
import 'package:fake_currency/features/auth/data/models/login_input_model.dart';
import 'package:fake_currency/features/auth/data/models/login_model.dart';
import 'package:fake_currency/features/auth/data/models/signup_input_model.dart';
import 'package:fake_currency/features/auth/data/models/signup_model.dart';
import 'package:fake_currency/features/auth/data/repo/auth_repo.dart';
import 'package:fake_currency/features/auth/data/source/auth_remote_datasource.dart';

import '../source/auth_local_datasource.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDatasource _authRemoteDatasource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl({
    required AuthRemoteDatasource authRemoteDatasource,
    required AuthLocalDataSource authLocalDataSource,
  }) : _authRemoteDatasource = authRemoteDatasource,
       _authLocalDataSource = authLocalDataSource;
  @override
  Future<Either<Failure, SignupModel>> signup(SignupInputModel input) async {
    try {
      final result = await _authRemoteDatasource.signup(input);
      await _authLocalDataSource.saveToken(result.accessToken);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage ?? ''));
    } on CustomException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, LoginModel>> login(LoginInputModel input) async {
    try {
      final result = await _authRemoteDatasource.login(input);
      await _authLocalDataSource.saveToken(result.accessToken);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage ?? ''));
    } on CustomException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _authLocalDataSource.clearToken();
      return Right(null);
    } on CustomException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ForgetPassModel>> forgetPass(String email) async {
    try {
      final result = await _authRemoteDatasource.forgetPass(email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage ?? ''));
    }
  }
}
