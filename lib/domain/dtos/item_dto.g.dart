// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemDTO _$ItemDTOFromJson(Map<String, dynamic> json) => ItemDTO(
      file: json['file'] as String,
      path: json['path'] as String,
      name: json['name'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$ItemDTOToJson(ItemDTO instance) => <String, dynamic>{
      'file': instance.file,
      'path': instance.path,
      'name': instance.name,
      'created': instance.created,
    };
