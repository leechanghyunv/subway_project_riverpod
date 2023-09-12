// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arrival_filted_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FiltedArrivalModel _$$_FiltedArrivalModelFromJson(
        Map<String, dynamic> json) =>
    _$_FiltedArrivalModel(
      arrival: (json['arrival'] as List<dynamic>?)
          ?.map((e) => ArrivalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      upfirst: json['upfirst'] as String? ?? "정보없음",
      uplast: json['uplast'] as String? ?? "정보없음",
      downfirst: json['downfirst'] as String? ?? "정보없음",
      downlast: json['downlast'] as String? ?? "정보없음",
    );

Map<String, dynamic> _$$_FiltedArrivalModelToJson(
        _$_FiltedArrivalModel instance) =>
    <String, dynamic>{
      'arrival': instance.arrival,
      'upfirst': instance.upfirst,
      'uplast': instance.uplast,
      'downfirst': instance.downfirst,
      'downlast': instance.downlast,
    };
