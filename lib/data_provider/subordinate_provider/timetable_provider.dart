// Project imports:
import '../../../setting/export+.dart';
import '../../../setting/export.dart';

/// code 값을 바탕으로 지하철역 정보를 받아오는 구간

final apiservice = SeoulApiService.create();

final subTableProvider = FutureProvider.family<TableProviderModel,String>((ref,code) async {

  String output;

  final String ee = DateFormat('EEE').format(DateTime.now());

  output = switch(ee) {"Sat" => '2', "Sun" => '2', _ => '1'};

  final responseA = await apiservice.getTable(code, output, '1');
  final responseB = await apiservice.getTable(code, output, '2');
  if(responseA.statusCode == 200 && responseB.statusCode == 200){
    try{
      final List<dynamic> jsonBodyA = jsonDecode(responseA.body)['SearchSTNTimeTableByIDService']['row'];
      final List<dynamic> jsonBodyB = jsonDecode(responseB.body)['SearchSTNTimeTableByIDService']['row'];
      List<TableModel> tableA = jsonBodyA.map((e) => TableModel.fromJson(e)).toList();
      List<TableModel> tableB = jsonBodyB.map((e) => TableModel.fromJson(e)).toList();
      return TableProviderModel(tableA: tableA, tableB: tableB);
    }catch(e){
      throw(e.toString());
    }
  } else {
    throw Exception('Failed to load table data');
  }

});





