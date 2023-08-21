import 'package:intl/intl.dart';
import '../../setting/export.dart';

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
    final List<dynamic> jsonBody = jsonDecode(response.body)['SearchSTNTimeTableByIDService']['row'];
    return jsonBody.map((e) => TableModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load table data');
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
    throw Exception('Failed to load table data');
  }
}
);



