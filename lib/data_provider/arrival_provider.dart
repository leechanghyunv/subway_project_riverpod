import '../setting/export.dart';

final apiservice = ArrivalApiService.create();

final arrivalProvider = FutureProvider.autoDispose<List<ArrivalModel>>((ref) async {

  final subwayinfo = ref.watch(infoProvider);
  final name = subwayinfo.elementAtOrNull(0)?.subname;
  final response = await apiservice.getArrival(name!);

  if (response.statusCode == 200) {
    final List<dynamic> jsonBody = jsonDecode(response.body)['realtimeArrivalList'];
    return jsonBody.map((e) => ArrivalModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load arrival data');
  }
});


class ArrivalController extends StateNotifier<List<ArrivalModel>>{
  final String name;
  final String line;
  ArrivalController(this.name,this.line) : super([]);

  var updnLine1 = ['상행', '내선'],  updnLine2 = ['하행', '외선'];

  List<dynamic> get filtedArrival => state.where((e) => e.subwayId == line).toList();

  String get updn1First => state.where((e) => e.subwayId == line).
  where((e) => updnLine1.contains(e.updnLine)).map((e)
  => '${e.trainLineNm} ${e.arvlMsg2}').first;

  String get updn1Last => state.where((e) => e.subwayId == line).
  where((e) => updnLine1.contains(e.updnLine)).map((e)
  => '${e.trainLineNm} ${e.arvlMsg2}').last;

  String get updn2First => state.where((e) => e.subwayId == line).
  where((e) => updnLine2.contains(e.updnLine)).map((e)
  => '${e.trainLineNm} ${e.arvlMsg2}').first;

  String get updn2Last => state.where((e) => e.subwayId == line).
  where((e) => updnLine2.contains(e.updnLine)).map((e)
  => '${e.trainLineNm} ${e.arvlMsg2}').last;

  Future<void> fetchArrival() async {
    final response = await apiservice.getArrival(name);
    if(response.statusCode == 200){
      final List<dynamic> jsonBody = jsonDecode(response.body)['realtimeArrivalList'];
      state = jsonBody.map((e) => ArrivalModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load arrival data');
    }
  }
}

final arrivalListProvider = StateNotifierProvider<
    ArrivalController,List<ArrivalModel>>((ref){
      final subinfo = ref.watch(infoProvider);
      final line = ref.watch(lineToArrivalProvider);
      final String name = subinfo.first.subname;
      return ArrivalController(name,line);
});






final arrivalProviderT = StreamProvider.autoDispose<List<ArrivalModel>>((ref) async* {

  final name = box.read('nameT');
  final response = await apiservice.getArrival(name!);

  if (response.statusCode == 200) {
    final List<dynamic> jsonBody = jsonDecode(response.body)['realtimeArrivalList'];
    yield jsonBody.map((e) => ArrivalModel.fromJson(e)).toList();

  } else {
    throw Exception('Failed to load arrival data');
  }
});
