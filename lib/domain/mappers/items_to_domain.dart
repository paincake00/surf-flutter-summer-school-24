import 'package:surf_flutter_summer_school_24/domain/dtos/item_dto.dart';
import 'package:surf_flutter_summer_school_24/domain/dtos/items_dto.dart';
import 'package:surf_flutter_summer_school_24/domain/mappers/item_to_domain.dart';
import 'package:surf_flutter_summer_school_24/domain/models/items.dart';

extension ItemsFromDTOToDomain on ItemsDTO {
  Items toDomain() {
    return Items(
      items: items?.map((ItemDTO e) => e.toDomain()).toList(),
    );
  }
}
