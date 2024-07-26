import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/data/api/service/api_service.dart';
import 'package:surf_flutter_summer_school_24/domain/models/items.dart';
import 'package:surf_flutter_summer_school_24/domain/repositories/photo_repository.dart';

class ApiPhotoRepository implements PhotoRepository {
  late final ApiService _apiService;
  late final Dio _dio;

  ApiPhotoRepository({
    required ApiService apiService,
    required Dio dio,
  })  : _apiService = apiService,
        _dio = dio;

  @override
  Future<Items?> getPhotos() async {
    return _apiService.getPhotos(_dio);
  }

  @override
  Future<void> uploadPhoto(ImageSource imageSource) async {
    return _apiService.uploadPhoto(_dio, imageSource);
  }

  @override
  Future<void> deletePhoto(String path) {
    return _apiService.deletePhoto(_dio, path);
  }
}
