import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/signup_input_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepo) : super(SignupInitial());

  final AuthRepo _authRepo;

  void signup(SignupInputModel input) async {
    emit(SignupLoading());
    final userOrfailure = await _authRepo.signup(input);
    userOrfailure.fold(
      (l) => emit(SignupFailure(errMessage: l.errMessage)),
      (r) => emit(SignupLoaded()),
    );
  }
}
