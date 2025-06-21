import 'package:dartz/dartz.dart';
import 'package:fake_currency/core/networking/exceptions.dart';
import 'package:fake_currency/features/main/data/datasource/main_remote_datasource.dart';
import 'package:fake_currency/features/main/data/repo/main_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/networking/failure.dart';

class MainRepoImpl extends MainRepo {
  final MainRemoteDatasource _datasource;

  MainRepoImpl({required MainRemoteDatasource datasource})
    : _datasource = datasource;
  @override
  Future<Either<Failure, String>> uploadImage({required XFile image}) async {
    try {
      final result = await _datasource.uploadImage(image: image);
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage!));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    await injector<SharedPreferences>().clear();
    return Right(null);
  }
}
