import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../chopper_refository/restApi_room.dart';
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

final dustLevelProvider = FutureProvider<List<DustModel>>((ref) async {

  final apiservice = SeoulApiService.create();
  final response = await apiservice.getDust();

  if (response.statusCode == 200){
    final List<dynamic> jsonBody = jsonDecode(response.body)['RealtimeCityAir']['row'];
    return jsonBody.map((e) => DustModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load user data');
  }
});


final dustProvider = Provider<List<DustInfo>>((ref) {

  final dustlevel = ref.watch(dustLevelProvider);

  if(dustlevel.value != null){
    double? level = double.tryParse(dustlevel.value!.map((e) => e.pm10).
    reduce((a, b) => a+b/dustlevel.value!.length).toStringAsFixed(2));
    if(level != null){
      if (level < 20.0) {
        return  [
          DustInfo(barLevel: 'Line4',commnet: '아주맑음')
        ];
      } else if (level < 50.0) {
        return [
          DustInfo(barLevel: 'Line2',commnet: '맑음')
        ];
      } else if (level < 100.0) {
        return [
          DustInfo(barLevel: 'Line3',commnet: '보통')
        ];
      } else if (level < 150.0) {
        return [
          DustInfo(barLevel: 'Line8',commnet: '나쁨')
        ];
      } else {
        return [
          DustInfo(barLevel: 'Line8',commnet: '아주나쁨')
        ];
      }
    } else {
      return [
        DustInfo(barLevel: 'Line2',commnet: '0000')
      ];
    }
  }
  return [
    DustInfo(barLevel: 'Line2',commnet: '0000')
  ];



});