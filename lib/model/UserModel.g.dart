// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserFields _$$_UserFieldsFromJson(Map<String, dynamic> json) =>
    _$_UserFields(
      id: json['id'] as int,
      gender: json['gender'] as String,
      age: json['age'] as String,
      frequency: json['frequency'] as String,
      goodthing: json['goodthing'] as String,
      unconfortable: json['unconfortable'] as String,
      comment1: json['comment1'] as String,
      currentTime: json['currentTime'] as String?,
    );

Map<String, dynamic> _$$_UserFieldsToJson(_$_UserFields instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'age': instance.age,
      'frequency': instance.frequency,
      'goodthing': instance.goodthing,
      'unconfortable': instance.unconfortable,
      'comment1': instance.comment1,
      'currentTime': instance.currentTime,
    };
