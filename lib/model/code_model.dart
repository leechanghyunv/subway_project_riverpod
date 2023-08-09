import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../chopper_refository/restApi_room.dart';
import 'data_model.dart';
part 'code_model.freezed.dart';
part 'code_model.g.dart';

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


final apiCodeProvider = FutureProvider<List<CodeModel>>((ref) async {

  final subwayInfo = ref.watch(infoProvider);
  final apiservice = SeoulApiService.create();

  var name = subwayInfo.elementAtOrNull(0)?.subname;

  if(name == '서울'){
    name = '서울역';
  }

  final nameWithoutParentheses = name?.replaceAll(RegExp(r'\([^()]*\)'), '');
  final response = await apiservice.getCode(nameWithoutParentheses!);
  if(response.statusCode == 200){
    final List<dynamic> jsonBody = jsonDecode(response.body)['SearchInfoBySubwayNameService']['row'];
    print('codeProvider 저장완료');
    return jsonBody.map((e) => CodeModel.fromJson(e)).toList();

  } else {
    throw Exception('Failed to load user data');
  }
});
