// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_chip_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChipModelAdapter extends TypeAdapter<_$_ChipModel> {
  @override
  final int typeId = 1;

  @override
  _$_ChipModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ChipModel(
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ChipModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChipModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChipModel _$$_ChipModelFromJson(Map<String, dynamic> json) => _$_ChipModel(
      name: json['name'] as String? ?? '정보없음',
    );

Map<String, dynamic> _$$_ChipModelToJson(_$_ChipModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
