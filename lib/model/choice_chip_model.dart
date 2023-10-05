import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'choice_chip_model.freezed.dart';
part 'choice_chip_model.g.dart';

@freezed
class ChipModel with _$ChipModel {
  @HiveType(typeId: 1)
  const factory ChipModel({
    @HiveField(1)
    @Default('정보없음') String name,
  }) = _ChipModel;

  factory ChipModel.fromJson(Map<String, dynamic> json) =>
      _$ChipModelFromJson(json);
}