// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DistModel _$$_DistModelFromJson(Map<String, dynamic> json) => _$_DistModel(
      latA: json['latA'] as String? ?? "정보없음",
      lngA: json['lngA'] as String? ?? "정보없음",
      nameA: json['nameA'] as String? ?? "정보없음",
      latB: json['latB'] as String? ?? "정보없음",
      lngB: json['lngB'] as String? ?? "정보없음",
      nameB: json['nameB'] as String? ?? "정보없음",
    );

Map<String, dynamic> _$$_DistModelToJson(_$_DistModel instance) =>
    <String, dynamic>{
      'latA': instance.latA,
      'lngA': instance.lngA,
      'nameA': instance.nameA,
      'latB': instance.latB,
      'lngB': instance.lngB,
      'nameB': instance.nameB,
    };
