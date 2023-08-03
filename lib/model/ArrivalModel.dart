import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:subway_project_230704/chopper_refository/RestApi_Room.dart';
import '../screen/LayoutScreen.dart';
import 'DataModel.dart';
part 'ArrivalModel.freezed.dart';
part 'ArrivalModel.g.dart';

@Freezed()
class ArrivalModel with _$ArrivalModel{
  const factory ArrivalModel({
    @Default("정보없음") String subwayId, /// 호선번호 1001,1002 ~~
    @Default("정보없음") String updnLine, /// 상행,하행,내선,외선
    @Default("정보없음") String trainLineNm, /// "방화행 - 마장방면",
    @Default("정보없음") String statnFid,   /// 이전지하철역ID - 1004 00 0427 - 4호선 회현 0427
    @Default("정보없음") String statnTid,   /// 다음지하철역ID - 1004 00 0425
    @Default("정보없음") String statnId,   /// 지하철역ID - 1004 00 0426
    @Default("정보없음") String statnNm,  /// 지하철역명
    @Default("정보없음") String subwayList, /// 지하철역 호선 리스트 "1001,1004,1063,1065",
    @Default("정보없음") String btrainSttus,  /// ITX(T), 급행(EXP(S)), 일반(NOR(S))
    @Default("정보없음") String btrainNo, /// 열차번호
    @Default("정보없음") String bstatnNm, /// 종착
    @Default("정보없음") String arvlMsg2, /// 도착메시지
    @Default("정보없음") String arvlCd, /// 실시간 열차 상태
  }) = _ArrivalModel;
  factory ArrivalModel.fromJson(Map<String, Object?> json) => _$ArrivalModelFromJson(json);
}

final apiservice = ArrivalApiService.create();

final arrivalProvider = StreamProvider.autoDispose<List<ArrivalModel>>((ref) async* {

  final subwayinfo = ref.watch(infoProvider);
  final name = subwayinfo.elementAtOrNull(0)?.subname;
  final response = await apiservice.getArrival(name!);

  if (response.statusCode == 200) {
    final List<dynamic> jsonBody = jsonDecode(response.body)['realtimeArrivalList'];
    yield jsonBody.map((e) => ArrivalModel.fromJson(e)).toList();

  } else {
    throw Exception('Failed to load user data');
  }

});


final arrivalProviderT = StreamProvider.autoDispose<List<ArrivalModel>>((ref) async* {

  final name = box.read('nameT');
  final response = await apiservice.getArrival(name!);

  if (response.statusCode == 200) {
    final List<dynamic> jsonBody = jsonDecode(response.body)['realtimeArrivalList'];
    yield jsonBody.map((e) => ArrivalModel.fromJson(e)).toList();

  } else {
    throw Exception('Failed to load user data');
  }
});