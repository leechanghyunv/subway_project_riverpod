import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../screen/MainScreen.dart';
import 'DataModel.dart';
part 'CodeModel.freezed.dart';
part 'CodeModel.g.dart';

@Freezed()
class CodeModel with _$CodeModel{
  const factory CodeModel({
    @Default("정보없음") @JsonKey(name: 'STATION_CD') String stationCd,
    @Default("정보없음") @JsonKey(name: 'STATION_NM') String subname,
    @Default("정보없음") @JsonKey(name: 'LINE_NUM') String line,
    @Default("정보없음") @JsonKey(name: 'FR_CODE') String code,
  }) = _CodeModel;
  factory CodeModel.fromJson(Map<String, Object?> json) => _$CodeModelFromJson(json);
}

/// http://openapi.seoul.go.kr:8088/4c6f72784b6272613735677166456d/json/SearchInfoBySubwayNameService/1/5/서울역

final apiCodeProvider = FutureProvider<List<CodeModel>>((ref) async {

  final subwayInfo = ref.watch(infoProvider);

  final String key = '4c6f72784b6272613735677166456d';
  var name = subwayInfo.elementAtOrNull(0)?.subname;

  if(name == '서울'){
    name = '서울역';
  }

  final nameWithoutParentheses = name?.replaceAll(RegExp(r'\([^()]*\)'), '');
  final Url = 'http://openapi.seoul.go.kr:8088/$key/json/SearchInfoBySubwayNameService/1/5/$nameWithoutParentheses';
  final response = await http.get(Uri.parse(Url));
  if(response.statusCode == 200){
    final List<dynamic> jsonBody = jsonDecode(response.body)['SearchInfoBySubwayNameService']['row'];
    return jsonBody.map((e) => CodeModel.fromJson(e)).toList();

  } else {
    throw Exception('Failed to load user data');
  }
});
