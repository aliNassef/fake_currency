import 'package:bloc/bloc.dart';
import 'package:fake_currency/features/main/data/repo/main_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepo mainRepo;
  MainCubit(this.mainRepo) : super(MainInitial());

  void detectCurrency({required XFile image}) async {
    emit(MainLoading());
    final result = await mainRepo.uploadImage(image: image);
    result.fold(
      (failure) => emit(MainError(failure.errMessage)),
      (success) => emit(MainSuccess(success, image)),
    );
  }

  void logout() async {
    await mainRepo.logout();
    emit(MainLogout());
  }
}
