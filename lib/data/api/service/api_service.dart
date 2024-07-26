import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/domain/dtos/items_dto.dart';
import 'package:surf_flutter_summer_school_24/domain/mappers/items_to_domain.dart';
import 'package:surf_flutter_summer_school_24/domain/models/items.dart';

class ApiService {
  late final String? _token;

  ApiService({
    required String? token,
  }) : _token = token;

  Dio dioInit({String? apiUrl}) {
    if (apiUrl != null) {
      return Dio(BaseOptions(contentType: 'application/json', baseUrl: apiUrl));
    }
    return Dio(BaseOptions(contentType: 'application/json'));
  }

  Future<Items?> uploadPhoto(Dio dio, ImageSource imageSource) async {
    try {
      final picker = ImagePicker();
      final imageFromGallery = await picker.pickImage(source: imageSource);
      if (imageFromGallery == null) return getPhotos(dio);

      final responseUpload = await dio.get(
        'v1/disk/resources/upload',
        queryParameters: {
          'path': imageFromGallery.name,
        },
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'OAuth $_token',
          },
        ),
      );

      final json = responseUpload.data as Map<String, dynamic>;
      final String linkToUpload = json['href'] as String;

      final file = File(imageFromGallery.path);
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
      });
      await dio.put(linkToUpload, data: formData);

      return getPhotos(dio);
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw Exception('Unauthorized');
        }
        if (e.response?.statusCode == 404) {
          throw Exception('Not found');
        }
        if (e.response?.statusCode == 409) {
          throw Exception('Resource already exists');
        }
        if (e.response?.statusCode == 500) {
          throw Exception('Server error');
        }
      }
    }
    return null;
  }

  Future<Items?> getPhotos(Dio dio) async {
    try {
      final response = await dio.get(
        'v1/disk/resources/files',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'OAuth $_token',
          },
        ),
      );

      final ItemsDTO dto =
          ItemsDTO.fromJson(response.data as Map<String, dynamic>);
      final Items items = dto.toDomain();
      return items;
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw Exception('Unauthorized');
        }
        if (e.response?.statusCode == 404) {
          throw Exception('Not found');
        }
        if (e.response?.statusCode == 500) {
          throw Exception('Server error');
        }
      }
    }
    return null;
  }

  Future<Items?> deletePhoto(Dio dio, String path) async {
    try {
      await dio.delete(
        'v1/disk/resources',
        queryParameters: {
          'path': path,
          'permanently': true,
        },
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'OAuth $_token',
          },
        ),
      );
      return getPhotos(dio);
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          throw Exception('Unauthorized');
        }
        if (e.response?.statusCode == 500) {
          throw Exception('Server error');
        }
      }
    }
    return null;
  }
}
