// Project imports:
import 'package:subway_project_230704/setting/export.dart';
import '../../presentation/screen/screen_controller.dart';
import '../subordinate_provider/code_provider.dart';
/// 역 정보를 모두 필터링한 뒤에 출발지점 혹은 도착지 정보를 저장하는 구간임 이 구간은 UI변경에 결정적인 역할
class StoreDataController extends StateNotifier<List<SubwayModel>>{

  final AsyncValue<List<CodeModel>> subCode;
  final List<SubwayModel> subInfo;

  StoreDataController(this.subCode, this.subInfo) : super([]);

  Future<void> storeSubData(String value) async {
    var info = subInfo.first;
    switch(value){
      case 'A':
        subCode.whenData((value){
          final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
          var result = subCode.value?[index!].stationCd;
          box.write('codeA',result);
          print('codeA');
        });
        await box.write('nameA',info.subname);
        await box.write('latA',info.lat);
        await box.write('lngA',info.lng);
        await box.write('engnameA',info.engname);
        await box.write('lineA',info.line_ui);
        await box.write('sublistA',info.subwayid.toString());
        await box.write('lineAA',info.line);
        await box.write('headingA',info.heading);
        return print('SaveA');
      case 'B':
        subCode.whenData((value){
          final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
          var result = subCode.value?[index!].stationCd;
          box.write('codeB',result);
          print('codeB');
        });
        await box.write('nameB',info.subname);
        await box.write('latB',info.lat);
        await box.write('lngB',info.lng);
        await box.write('engnameB',info.engname);
        await box.write('lineB',info.line_ui);
        await box.write('sublistB',info.subwayid.toString());
        await box.write('lineBB',info.line);
        await box.write('headingB',info.heading);
        return print('SaveB');
      case 'T':
        subCode.whenData((value){
          final index = subCode.value?.indexWhere((e) => e.line == subInfo[0].line);
          var result = subCode.value?[index!].stationCd;
          box.write('codeT',result);
        });
        await box.write('nameT',info.subname);
        await box.write('latT',info.lat);
        await box.write('lngT',info.lng);
        await box.write('engnameT',info.engname);
        await box.write('lineT',info.line_ui);
        await box.write('sublistT',info.subwayid.toString());
        await box.write('lineTT',info.line);
        await box.write('headingT',info.heading);
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
