import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/domain/models/items.dart';
import 'package:surf_flutter_summer_school_24/domain/repositories/photo_repository.dart';

class PhotoController with ChangeNotifier {
  final PhotoRepository _photoRepository;

  PhotoController({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  late final ValueNotifier<Items?> _photos = ValueNotifier<Items?>(null);

  ValueListenable<Items?> get photos => _photos;

  Future<void> getPhotos() async {
    _photos.value = await _photoRepository.getPhotos();
  }

  void uploadPhoto(ImageSource imageSource) async {
    _photos.value = await _photoRepository.uploadPhoto(imageSource);
  }

  void deletePhoto(String path) async {
    _photos.value = await _photoRepository.deletePhoto(path);
  }
}
