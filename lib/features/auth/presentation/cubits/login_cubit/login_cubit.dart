import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/login_input_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());
  final AuthRepo _authRepo;

  void login(LoginInputModel input) async {
    emit(LoginLoading());
    final userOrfailure = await _authRepo.login(input);
    userOrfailure.fold(
      (l) => emit(LoginFailure(errMessage: l.errMessage)),
      (r) => emit(LoginLoaded()),
    );
  }
}
