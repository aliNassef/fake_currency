import 'package:bloc/bloc.dart';
import 'package:fake_currency/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._authRepo) : super(ForgetPasswordInitial());
  final AuthRepo _authRepo;
  void forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    final result = await _authRepo.forgetPass(email);
    result.fold(
      (l) => emit(ForgetPasswordFailure(errMessage: l.errMessage)),
      (r) => emit(ForgetPasswordLoaded(token: r.token)),
    );
  }

  void verificationCode(String code, String token) async {
    emit(ForgetPasswordVerificationLoading());
    final result = await _authRepo.verifyCode(code, token);
    result.fold(
      (l) => emit(ForgetPasswordVerificationFailure(errMessage: l.errMessage)),
      (r) => emit(ForgetPasswordVerificationLoaded()),
    );
  }

  void resetPassword(String password, String token) async {
    emit(ForgetPasswordResetLoading());
    final result = await _authRepo.resetPassword(password, token);
    result.fold(
      (l) => emit(ForgetPasswordResetFailure(errMessage: l.errMessage)),
      (r) => emit(ForgetPasswordResetLoaded()),
    );
  }
}
