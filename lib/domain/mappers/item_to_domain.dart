import 'package:surf_flutter_summer_school_24/domain/dtos/item_dto.dart';
import 'package:surf_flutter_summer_school_24/domain/models/item.dart';

extension ItemFromDTOToDomain on ItemDTO {
  Item toDomain() {
    return Item(
      file: file,
      path: path,
      name: name,
      created: created.substring(0, 10),
    );
  }
}
