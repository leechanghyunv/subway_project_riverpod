import 'package:subway_project_230704/setting/export.dart';
import '../code_provider.dart';

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
