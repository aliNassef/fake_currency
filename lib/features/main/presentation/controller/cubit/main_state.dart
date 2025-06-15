part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class MainLoading extends MainState {}

final class MainSuccess extends MainState {
  final String detectedClass;
  final XFile image;
  MainSuccess(this.detectedClass, this.image);
}

final class MainError extends MainState {
  final String errMessage;
  MainError(this.errMessage);
}
