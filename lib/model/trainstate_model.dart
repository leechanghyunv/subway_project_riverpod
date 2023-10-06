// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainstate_model.freezed.dart';
part 'trainstate_model.g.dart';

@freezed
class TrainModel with _$TrainModel {
  const factory TrainModel({
    @Default("3728") String subNumber1,
    @Default("99") String subState1,
    @Default("NOR(S)") String state1,
    @Default("") String destination1,

    @Default("3728") String subNumber2,
    @Default("99") String subState2,
    @Default("NOR(S)") String state2,
    @Default("") String destination2,
  }) = _TrainModel;

  factory TrainModel.fromJson(Map<String, dynamic> json) =>
      _$TrainModelFromJson(json);
}
