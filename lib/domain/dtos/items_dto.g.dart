// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsDTO _$ItemsDTOFromJson(Map<String, dynamic> json) => ItemsDTO(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemsDTOToJson(ItemsDTO instance) => <String, dynamic>{
      'items': instance.items,
    };
