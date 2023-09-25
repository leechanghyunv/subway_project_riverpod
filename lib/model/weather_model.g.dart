// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherInfo _$$_WeatherInfoFromJson(Map<String, dynamic> json) =>
    _$_WeatherInfo(
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: Weather.fromJson(json['weather'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WeatherInfoToJson(_$_WeatherInfo instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
    };

_$_Main _$$_MainFromJson(Map<String, dynamic> json) => _$_Main(
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      tempMin: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
      tempMax: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_MainToJson(_$_Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
    };

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      id: json['id'] as int? ?? 0,
      main: json['main'] as String? ?? "정보없음",
      description: json['description'] as String? ?? "정보없음",
      icon: json['icon'] as String? ?? "정보없음",
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
