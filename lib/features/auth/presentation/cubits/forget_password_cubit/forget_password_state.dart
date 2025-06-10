part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordLoaded extends ForgetPasswordState {
  final String token;

  ForgetPasswordLoaded({required this.token});
}
final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errMessage;

  ForgetPasswordFailure({required this.errMessage});
}

final class ForgetPasswordVerificationLoading extends ForgetPasswordState {}
final class ForgetPasswordVerificationLoaded extends ForgetPasswordState {}
final class ForgetPasswordVerificationFailure extends ForgetPasswordState {
  final String errMessage;

  ForgetPasswordVerificationFailure({required this.errMessage});
}

final class ForgetPasswordResetLoading extends ForgetPasswordState {}
final class ForgetPasswordResetLoaded extends ForgetPasswordState {}
final class ForgetPasswordResetFailure extends ForgetPasswordState {
  final String errMessage;

  ForgetPasswordResetFailure({required this.errMessage});
}
