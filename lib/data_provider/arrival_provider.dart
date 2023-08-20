
import '../setting/export.dart';

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
