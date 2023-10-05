import '../setting/export.dart';

/// json file에서 데이터를 가져옴
final dataProviderInside = FutureProvider<List<SubwayModel>>((ref) async {
  final  jsonData = await rootBundle.loadString('assets/test.json');
  final List<dynamic> data = jsonDecode(jsonData)['subwaydata'];
  return data.map((e) => SubwayModel.fromJson(e)).toList();
});