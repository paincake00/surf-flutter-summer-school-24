import 'package:json_annotation/json_annotation.dart';
import 'package:surf_flutter_summer_school_24/domain/dtos/item_dto.dart';

part 'items_dto.g.dart';

@JsonSerializable()
class ItemsDTO {
  @JsonKey(name: 'items')
  final List<ItemDTO>? items;

  ItemsDTO({
    this.items,
  });

  factory ItemsDTO.fromJson(Map<String, dynamic> json) =>
      _$ItemsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsDTOToJson(this);
}
