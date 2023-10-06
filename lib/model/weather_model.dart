// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../setting/export.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';


@freezed
class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required Main main,
    required Weather weather,
  }) = _WeatherInfo;
  factory WeatherInfo.fromJson(Map<String, dynamic> json) => _$WeatherInfoFromJson(json);
}

@Freezed()
class Main with _$Main{
  const factory Main({
    @Default(0.0) double temp,
    @Default(0.0) @JsonKey(name: 'feels_like') double feelsLike, /// 체감온도
    @Default(0.0) @JsonKey(name: 'temp_min') double tempMin,
    @Default(0.0) @JsonKey(name: 'temp_max') double tempMax,
  }) = _Main;
  factory Main.fromJson(Map<String, Object?> json) => _$MainFromJson(json);
}

@Freezed()
class Weather with _$Weather{
  const factory Weather({
    @Default(0) int id,
    @Default("정보없음") String main,
    @Default("정보없음") String description,
    @Default("정보없음") String icon,
  }) =_Weather;
  factory Weather.fromJson(Map<String, Object?> json) => _$WeatherFromJson(json);
}


