import 'package:freezed_annotation/freezed_annotation.dart';

import 'arrival_model.dart';
part 'arrival_filted_model.freezed.dart';
part 'arrival_filted_model.g.dart';

@freezed
class FiltedArrivalModel with _$FiltedArrivalModel {
  const factory FiltedArrivalModel({
    List<ArrivalModel>? arrival,
    @Default("정보없음") String? upfirst,
    @Default("정보없음") String? uplast,
    @Default("정보없음") String? downfirst,
    @Default("정보없음") String? downlast,
  }) = _FiltedArrivalModel;

  factory FiltedArrivalModel.fromJson(Map<String, dynamic> json) =>
      _$FiltedArrivalModelFromJson(json);
}