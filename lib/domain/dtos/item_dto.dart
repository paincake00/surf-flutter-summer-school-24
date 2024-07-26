import 'package:json_annotation/json_annotation.dart';

part 'item_dto.g.dart';

@JsonSerializable()
class ItemDTO {
  @JsonKey(name: 'file')
  final String file;

  @JsonKey(name: 'path')
  final String path;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'created')
  final String created;

  ItemDTO({
    required this.file,
    required this.path,
    required this.name,
    required this.created,
  });

  factory ItemDTO.fromJson(Map<String, dynamic> json) =>
      _$ItemDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDTOToJson(this);
}
