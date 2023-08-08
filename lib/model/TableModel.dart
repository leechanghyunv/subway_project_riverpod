import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../chopper_refository/RestApi_Room.dart';
part 'TableModel.g.dart';
part 'TableModel.freezed.dart';

@Freezed()
class TableModel with _$TableModel{
  const factory TableModel({
    @Default("정보없음") @JsonKey(name: 'STATION_CD') String stationcd,
    @Default("정보없음") @JsonKey(name: 'STATION_NM') String stationnm,
    @Default("정보없음") @JsonKey(name: 'ARRIVETIME')  String arrivetime,
    @Default("정보없음") @JsonKey(name: 'ORIGINSTATION') String originstation,
    @Default("정보없음") @JsonKey(name: 'SUBWAYSNAME') String sname,
    @Default("정보없음") @JsonKey(name: 'SUBWAYENAME') String ename,
    @Default(EXPRESS.GENERAL) @JsonKey(name: 'EXPRESS_YN') EXPRESS express,
  }) = _TableModel;
  factory TableModel.fromJson(Map<String, Object?> json) => _$TableModelFromJson(json);
}
@JsonEnum(valueField: 'initial')
enum EXPRESS {
  GENERAL('G'),
  DIRECT('D');

  final String initial;
  const EXPRESS(this.initial);
}

final apiservice = SeoulApiService.create();

final subTableProviderA = FutureProvider.family<List<TableModel>,String>((ref,code) async {

  final String eee = DateFormat('EEE').format(DateTime.now());
  String callday(String day) {
    if (day == "Sat" || day == "Sun") {
      return '2';
    } else {
      return '1';
    }
  }

    final response = await apiservice.getTable(code, callday(eee), '1');
  if (response.statusCode == 200) {
    final List<dynamic> jsonBody =
    jsonDecode(response.body)['SearchSTNTimeTableByIDService']['row'];
    return jsonBody.map((e) => TableModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load user data');
  }
}
);

final subTableProviderB = FutureProvider.family<List<TableModel>,String>((ref,code) async {

  final String eee = DateFormat('EEE').format(DateTime.now());
  String callday(String day) {
    if (day == "Sat" || day == "Sun") {
      return '2';
    } else {
      return '1';
    }
  }

  final response = await apiservice.getTable(code, callday(eee), '2');
  if (response.statusCode == 200) {
    final List<dynamic> jsonBody =
    jsonDecode(response.body)['SearchSTNTimeTableByIDService']['row'];
    return jsonBody.map((e) => TableModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load user data');
  }
}
);




