// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainstate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrainModel _$$_TrainModelFromJson(Map<String, dynamic> json) =>
    _$_TrainModel(
      subNumber1: json['subNumber1'] as String? ?? "3728",
      subState1: json['subState1'] as String? ?? "99",
      state1: json['state1'] as String? ?? "NOR(S)",
      destination1: json['destination1'] as String? ?? "",
      subNumber2: json['subNumber2'] as String? ?? "3728",
      subState2: json['subState2'] as String? ?? "99",
      state2: json['state2'] as String? ?? "NOR(S)",
      destination2: json['destination2'] as String? ?? "",
    );

Map<String, dynamic> _$$_TrainModelToJson(_$_TrainModel instance) =>
    <String, dynamic>{
      'subNumber1': instance.subNumber1,
      'subState1': instance.subState1,
      'state1': instance.state1,
      'destination1': instance.destination1,
      'subNumber2': instance.subNumber2,
      'subState2': instance.subState2,
      'state2': instance.state2,
      'destination2': instance.destination2,
    };
