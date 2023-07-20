// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DustModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DustModel _$$_DustModelFromJson(Map<String, dynamic> json) => _$_DustModel(
      pm10: (json['PM10'] as num?)?.toDouble() ?? 0.0,
      pm25: (json['PM25'] as num?)?.toDouble() ?? 0.0,
      result: json['IDEX_NM'] as String? ?? "정보없음",
      region: json['MSRSTE_NM'] as String? ?? "정보없음",
    );

Map<String, dynamic> _$$_DustModelToJson(_$_DustModel instance) =>
    <String, dynamic>{
      'PM10': instance.pm10,
      'PM25': instance.pm25,
      'IDEX_NM': instance.result,
      'MSRSTE_NM': instance.region,
    };
