// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableProviderModel _$$_TableProviderModelFromJson(
        Map<String, dynamic> json) =>
    _$_TableProviderModel(
      tableA: (json['tableA'] as List<dynamic>)
          .map((e) => TableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tableB: (json['tableB'] as List<dynamic>)
          .map((e) => TableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TableProviderModelToJson(
        _$_TableProviderModel instance) =>
    <String, dynamic>{
      'tableA': instance.tableA,
      'tableB': instance.tableB,
    };
