import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import '../custom/SwitchDialogB.dart';
import '../screen/LayoutScreen.dart';
import '../setting/Geolocator.dart';
import 'CodeModel.dart';
part 'DataModel.freezed.dart';
part 'DataModel.g.dart';

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

  void storeSubData(String value){
    switch(value){
      case 'A':
        subCode.whenData((value){
          final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
          var result = subCode.value?[index!].stationCd;
          box.write('codeA',result);
          print('codeA : $result');
        });
        box.write('nameA',subInfo.first.subname);
        box.write('latA',subInfo.first.lat);
        box.write('lngA',subInfo.first.lng);
        box.write('engnameA',subInfo.first.engname);
        box.write('lineA',subInfo.first.line_ui);
        box.write('sublistA',subInfo.first.subwayid.toString());
        box.write('lineAA',subInfo.first.line);
        box.write('headingA',subInfo.first.heading);
        return print('SaveA and $subInfo');
      case 'B':
        subCode.whenData((value){
          final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
          var result = subCode.value?[index!].stationCd;
          box.write('codeB',result);
          print('codeB : ${result}');
        });
        box.write('nameB',subInfo.first.subname);
        box.write('latB',subInfo.first.lat);
        box.write('lngB',subInfo.first.lng);
        box.write('engnameB',subInfo.first.engname);
        box.write('lineB',subInfo.first.line_ui);
        box.write('sublistB',subInfo.first.subwayid.toString());
        box.write('lineBB',subInfo.first.line);
        box.write('headingB',subInfo.first.heading);
        return print('SaveB and $subInfo');
      case 'T':
        subCode.whenData((value){
          final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
          var result = subCode.value?[index!].stationCd;
          box.write('codeT',result);
        });
        box.write('nameT',subInfo.first.subname);
        box.write('latT',subInfo.first.lat);
        box.write('lngT',subInfo.first.lng);
        box.write('engnameT',subInfo.first.engname);
        box.write('lineT',subInfo.first.line_ui);
        box.write('sublistT',subInfo.first.subwayid.toString());
        box.write('lineTT',subInfo.first.line);
        box.write('headingT',subInfo.first.heading);
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
          LengthUnit.Kilometer,
          LatLng(location.value!.latitude, location.value!.longitude),
          LatLng(data.value![i].lat, data.value![i].lng));
      data.value![i] = data.value![i].setKm(km);
    }
  });

  data.value!.sort((a, b) => a.km!.compareTo(b.km!));
  return data.value!.where((element) => element.line_ui.contains(
      line)).toList();
});