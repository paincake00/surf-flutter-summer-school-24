import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_entity.g.dart';

@JsonSerializable()
class PhotoEntity extends Equatable {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  const PhotoEntity({
    required this.id,
    required this.url,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        createdAt,
      ];

  factory PhotoEntity.fromJson(Map<String, dynamic> json) => PhotoEntity(
        id: int.parse(json['id'].toString()),
        url: json['url'] as String,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => _$PhotoEntityToJson(this);
}
