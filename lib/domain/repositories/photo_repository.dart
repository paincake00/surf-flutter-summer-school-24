import 'package:surf_flutter_summer_school_24/domain/models/photo_entity.dart';

abstract interface class PhotoRepository {
  Future<List<PhotoEntity>>? getPhotos();
}
