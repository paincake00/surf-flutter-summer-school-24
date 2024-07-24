import 'package:surf_flutter_summer_school_24/domain/models/photo_entity.dart';
import 'package:surf_flutter_summer_school_24/domain/repositories/photo_repository.dart';

class MockPhotoRepository implements PhotoRepository {
  @override
  Future<List<PhotoEntity>> getPhotos() async {
    return [
      const PhotoEntity(
        id: 1,
        url: 'assets/images/4022.jpg',
      ),
      const PhotoEntity(
        id: 2,
        url: 'assets/images/4025.jpg',
      ),
      const PhotoEntity(
        id: 3,
        url: 'assets/images/4020.jpg',
      ),
      const PhotoEntity(
        id: 4,
        url: 'assets/images/4042.jpg',
      ),
      const PhotoEntity(
        id: 5,
        url: 'assets/images/4045.jpg',
      ),
      const PhotoEntity(
        id: 6,
        url: 'assets/images/5040.jpg',
      ),
      const PhotoEntity(
        id: 7,
        url: 'assets/images/5042.jpg',
      ),
    ];
  }
}
