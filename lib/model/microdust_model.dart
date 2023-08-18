import 'package:freezed_annotation/freezed_annotation.dart';
part 'microdust_model.g.dart';
part 'microdust_model.freezed.dart';

@Freezed()
class DustModel with _$DustModel{
  const factory DustModel({
    @Default(0.0) @JsonKey(name: 'PM10') double pm10,
    @Default(0.0) @JsonKey(name: 'PM25') double pm25,
    @Default("정보없음") @JsonKey(name: 'IDEX_NM') String result,
    @Default("정보없음") @JsonKey(name: 'MSRSTE_NM') String region,
  }) = _DustModel;

  factory DustModel.fromJson(Map<String, Object?> json) => _$DustModelFromJson(json);
}

@Freezed()
class DustInfo with _$DustInfo{
  const factory DustInfo({
    @Default('Line00') String barLevel,
    @Default('정보없음') String commnet,
  }) = _DustInfo;
}

