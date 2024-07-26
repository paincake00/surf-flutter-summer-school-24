import 'package:image_picker/image_picker.dart';
import 'package:surf_flutter_summer_school_24/domain/models/items.dart';

abstract interface class PhotoRepository {
  Future<Items?> getPhotos();

  Future<void> uploadPhoto(ImageSource imageSource);

  Future<void> deletePhoto(String path);
}
