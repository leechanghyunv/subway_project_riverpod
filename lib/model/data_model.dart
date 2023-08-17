import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/services.dart';
import '../api_provider/code_provider.dart';
import '../custom/switch_dialogB.dart';
import '../screen/layout_screen.dart';
import '../setting/geolocator.dart';
import 'code_model.dart';
import 'dart:convert';
part 'data_model.freezed.dart';
part 'data_model.g.dart';

@Freezed()
class SubwayModel with _$SubwayModel{
  const factory SubwayModel({
    required String subname,
    required String engname,
    required double lat,
    required double lng,
    required String line_ui,
    required int subwayid,
    required String line,
    required String heading,
    @Default(false) bool? isSelected,
    @Default(0.0) num? km,

  }) = _SubwayModel;
  factory SubwayModel.fromJson(Map<String, Object?> json) => _$SubwayModelFromJson(json);
}
extension MutableSubwayModelExtension on SubwayModel {
  SubwayModel setKm(double newKm) {
    return copyWith(km: newKm);
  }
}
/// json file에서 데이터를 가져옴
final dataProviderInside = FutureProvider<List<SubwayModel>>((ref) async {
  final  jsonData = await rootBundle.loadString('assets/test.json');
  final List<dynamic> data = jsonDecode(jsonData)['subwaydata'];
  return data.map((e) => SubwayModel.fromJson(e)).toList();
});
/// subwayname, line을 사용자가 선택한 이후에 결과를 가지고 데이터 필터링


class DataController extends StateNotifier<List<SubwayModel>>{

  final AsyncValue<List<SubwayModel>> subwaydata;
  DataController(this.subwaydata) : super([]);

  void searchSubway({required name, String? line}) {
    subwaydata.whenData((value){
      final searchResults = value.where((e){
        if(line != null){
          return e.subname == name && e.line_ui == line;
        } else {
          return e.subname == name;
        }
      }
      ).toList();
      print('InfoProvider 저장완료 ');
      state = searchResults;
    });
  }

}
final infoProvider = StateNotifierProvider<DataController,
    List<SubwayModel>>((ref){
  final database = ref.watch(dataProviderInside);
  return DataController(database);
});

final infoProviderB = StateNotifierProvider<DataController, /// popupmenu를 위한 가짜 프로바이더??? 사실상 기능없음
    List<SubwayModel>>((ref){
  final database = ref.watch(dataProviderInside);
  return DataController(database);
});
/// /// /// /// /// /// /// /// /// //
class StoreDataController extends StateNotifier<List<SubwayModel>>{

  final AsyncValue<List<CodeModel>> subCode;
  final List<SubwayModel> subInfo;

  StoreDataController(this.subCode, this.subInfo) : super([]);

  Future<void> storeSubData(String value) async {

    switch(value){
      case 'A':
          subCode.whenData((value){
            final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
            var result = subCode.value?[index!].stationCd;
            box.write('codeA',result);
            print('codeA');
          });
          await box.write('nameA',subInfo.first.subname);
          await box.write('latA',subInfo.first.lat);
          await box.write('lngA',subInfo.first.lng);
          await box.write('engnameA',subInfo.first.engname);
          await box.write('lineA',subInfo.first.line_ui);
          await box.write('sublistA',subInfo.first.subwayid.toString());
          await box.write('lineAA',subInfo.first.line);
          await box.write('headingA',subInfo.first.heading);
          return print('SaveA');
      case 'B':
          subCode.whenData((value){
            final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
            var result = subCode.value?[index!].stationCd;
            box.write('codeB',result);
            print('codeB');
          });
          await box.write('nameB',subInfo.first.subname);
          await box.write('latB',subInfo.first.lat);
          await box.write('lngB',subInfo.first.lng);
          await box.write('engnameB',subInfo.first.engname);
          await box.write('lineB',subInfo.first.line_ui);
          await box.write('sublistB',subInfo.first.subwayid.toString());
          await box.write('lineBB',subInfo.first.line);
          await box.write('headingB',subInfo.first.heading);
          return print('SaveB');
      case 'T':
          subCode.whenData((value){
            final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
            var result = subCode.value?[index!].stationCd;
            box.write('codeT',result);
          });
          await box.write('nameT',subInfo.first.subname);
          await box.write('latT',subInfo.first.lat);
          await box.write('lngT',subInfo.first.lng);
          await box.write('engnameT',subInfo.first.engname);
          await box.write('lineT',subInfo.first.line_ui);
          await box.write('sublistT',subInfo.first.subwayid.toString());
          await box.write('lineTT',subInfo.first.line);
          await box.write('headingT',subInfo.first.heading);
          return print('SaveT');
    }
  }
}

final storeProviderA = StateNotifierProvider<
    StoreDataController, List<SubwayModel>>((ref){
  final subInfo = ref.watch(infoProvider);
  final subCode = ref.watch(apiCodeProvider); /// infoProvider에서 나오는 전역변수를 바탕으로 업데이트
  return StoreDataController(subCode,subInfo);
});
/// distance calculator

final latlngProvider = FutureProvider.autoDispose<List<SubwayModel>>((ref) async {
  final Distance _distance =  Distance();
  final location = ref.watch(locationProvider);
  final line = ref.watch(latlonglineProvier);
  final data = ref.watch(dataProviderInside);

  data.whenData((value){
    for (var i = 0; i < data.value!.length; i++) {
      final km = _distance.as(
          LengthUnit.Meter,
          LatLng(location.value!.latitude, location.value!.longitude),
          LatLng(data.value![i].lat, data.value![i].lng));
      data.value![i] = data.value![i].setKm(km);
    }
  });

  data.value!.sort((a, b) => a.km!.compareTo(b.km!));
  return data.value!.where((element) => element.line_ui.contains(
      line)).toList();
});