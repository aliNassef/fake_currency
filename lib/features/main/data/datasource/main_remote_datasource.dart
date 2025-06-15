import 'package:fake_currency/core/networking/api_consumer.dart';
import 'package:fake_currency/core/networking/error_model.dart';
import 'package:fake_currency/core/networking/exceptions.dart';
import 'package:image_picker/image_picker.dart';

abstract class MainRemoteDatasource {
  Future<String> uploadImage({required XFile image});
}

class MainRemoteDatasourceImpl implements MainRemoteDatasource {
  final ApiService apiService;
  MainRemoteDatasourceImpl(this.apiService);
  @override
  Future<String> uploadImage({required XFile image}) async {
    final response = await apiService.postDataWithImage(image: image);
    if (response.statusCode == 200) {
      return response.data['detected_classes'][0];
    } else {
      throw ServerException(ErrorModel(errorMessage: response.data['detail']));
    }
  }
}
