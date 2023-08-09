// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableModel _$$_TableModelFromJson(Map<String, dynamic> json) =>
    _$_TableModel(
      stationcd: json['STATION_CD'] as String? ?? "정보없음",
      stationnm: json['STATION_NM'] as String? ?? "정보없음",
      arrivetime: json['ARRIVETIME'] as String? ?? "정보없음",
      originstation: json['ORIGINSTATION'] as String? ?? "정보없음",
      sname: json['SUBWAYSNAME'] as String? ?? "정보없음",
      ename: json['SUBWAYENAME'] as String? ?? "정보없음",
      express: $enumDecodeNullable(_$EXPRESSEnumMap, json['EXPRESS_YN']) ??
          EXPRESS.GENERAL,
    );

Map<String, dynamic> _$$_TableModelToJson(_$_TableModel instance) =>
    <String, dynamic>{
      'STATION_CD': instance.stationcd,
      'STATION_NM': instance.stationnm,
      'ARRIVETIME': instance.arrivetime,
      'ORIGINSTATION': instance.originstation,
      'SUBWAYSNAME': instance.sname,
      'SUBWAYENAME': instance.ename,
      'EXPRESS_YN': _$EXPRESSEnumMap[instance.express]!,
    };

const _$EXPRESSEnumMap = {
  EXPRESS.GENERAL: 'G',
  EXPRESS.DIRECT: 'D',
};
