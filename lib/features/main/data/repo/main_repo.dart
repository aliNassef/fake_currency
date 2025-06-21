import 'package:dartz/dartz.dart';
import 'package:fake_currency/core/networking/failure.dart';
import 'package:image_picker/image_picker.dart';

abstract class MainRepo {
  Future<Either<Failure, String>> uploadImage({required XFile image});
  Future<Either<Failure, void>> logout();
}