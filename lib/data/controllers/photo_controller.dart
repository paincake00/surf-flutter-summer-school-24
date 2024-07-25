import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/domain/models/items.dart';
import 'package:surf_flutter_summer_school_24/domain/repositories/photo_repository.dart';

class PhotoController with ChangeNotifier {
  final PhotoRepository _photoRepository;

  PhotoController({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  late final ValueNotifier<Future<Items?>> _photos =
      ValueNotifier<Future<Items?>>(_photoRepository.getPhotos());

  ValueListenable<Future<Items?>> get photos => _photos;

  void uploadPhoto(ImageSource imageSource) {
    _photoRepository.uploadPhoto(imageSource);
    updatePhotos();
  }

  Future<void> updatePhotos() async {
    _photos.value = _photoRepository.getPhotos();
    notifyListeners();
  }
}
