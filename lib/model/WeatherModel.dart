import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../chopper_refository/RestApi_Room.dart';
import '../setting/Geolocator.dart';
part 'WeatherModel.freezed.dart';
part 'WeatherModel.g.dart';

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


final key = '391af738f3d6aea930da389c0e6041ff';

final apiservice = WeatherApiService.create();

final weatherProvider = FutureProvider.autoDispose<List<Weather>>((ref) async {

  final location = ref.watch(locationProvider);

  if(location.value != null){

    var lat = location.value?.latitude.toString();
    var lng = location.value?.longitude.toString();

    final response = await apiservice.getWeather(lat!, lng!, key);
    if(response.statusCode == 200){
      final List<dynamic> jsonBody = jsonDecode(response.body)['weather'];
      print(jsonBody);
      return jsonBody.map((e) => Weather.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load user data Weather');
    }
  }
  throw Exception('Failed to load user data');
});


final tempProvider = FutureProvider.autoDispose<Main>((ref) async {

  final location = ref.watch(locationProvider);

  if(location.value != null){

    var lat = location.value?.latitude.toString();
    var lng = location.value?.longitude.toString();

    final response = await apiservice.getWeather(lat!, lng!, key);

    if(response.statusCode == 200){
      final Map<String, Object?> jsonBody = jsonDecode(response.body)['main'];
      print(jsonBody);
      return Main.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load user data Main');
    }
  }
  throw Exception('Failed to load user data');
});


final svgProvider = FutureProvider.autoDispose<Widget>((ref){

  final weather = ref.watch(weatherProvider);
  final condition = weather.value?.elementAt(0).id;

  if(condition != null){
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-colud_lightning.svg',
        color: Colors.black,
        height: 35,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
        color: Colors.black,
        height: 35,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black,
        height: 35,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black,
        height: 35,
      );
    }
    throw Exception('Failed to load user data');
  }
  return SvgPicture.asset(
    'svg/icon.svg',
    color: Colors.black,
    height: 35,
  );

});