import 'package:flutter/foundation.dart';
import 'package:surf_flutter_summer_school_24/domain/models/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/domain/repositories/photo_repository.dart';

class PhotoController with ChangeNotifier {
  final PhotoRepository _photoRepository;

  PhotoController({
    required PhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  late final ValueNotifier<Future<List<PhotoEntity>>?> _photos =
      ValueNotifier<Future<List<PhotoEntity>>?>(_photoRepository.getPhotos());

  ValueListenable<Future<List<PhotoEntity>>?> get photos => _photos;
}
