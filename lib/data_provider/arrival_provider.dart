// Project imports:
import '../model/arrival_filted_model.dart';
import '../setting/export.dart';

final apiservice = ArrivalApiService.create();

var updnLine1 = ['상행', '내선'], updnLine2 = ['하행', '외선'];

final filtedArrivalProvider = FutureProvider.family<FiltedArrivalModel,String>((ref,line) async {

  final subwayinfo = ref.watch(infoProvider);
  final name = subwayinfo.elementAtOrNull(0)?.subname;
  final response = await apiservice.getArrival(name!);

  if (response.statusCode == 200) {
    final List<dynamic> jsonBody = jsonDecode(response.body)['realtimeArrivalList'];
    List<ArrivalModel> model =  jsonBody.map((e) => ArrivalModel.fromJson(e)).toList();
    List<ArrivalModel> filtedModel = model.where((e) => e.subwayId == line).toList();
    var upside = filtedModel.where((e) => updnLine1.contains(e.updnLine));
    var downside = filtedModel.where((e) => updnLine2.contains(e.updnLine));

    return FiltedArrivalModel(
      arrival: jsonBody.map((e) => ArrivalModel.fromJson(e)).toList(),
      upfirst: upside.map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first,
      uplast: upside.map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last,
      downfirst: downside.map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first,
      downlast: downside.map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last,
    );
  } else {
    throw Exception('Failed to load arrival data');
  }
});

final filtedInPickerProvider = FutureProvider.family<FiltedArrivalModel,String>((ref,line) async {

  final subwayinfo = ref.watch(infoProvider);
  final name = subwayinfo.elementAtOrNull(0)?.subname;
  final response = await apiservice.getArrival(name!);

  if (response.statusCode == 200) {
    final List<dynamic> jsonBody = jsonDecode(response.body)['realtimeArrivalList'];
    List<ArrivalModel> model =  jsonBody.map((e) => ArrivalModel.fromJson(e)).toList();
    List<ArrivalModel> filtedModel = model.where((e) => e.subwayId == line).toList();
    var upside = filtedModel.where((e) => updnLine1.contains(e.updnLine));
    var downside = filtedModel.where((e) => updnLine2.contains(e.updnLine));

    return FiltedArrivalModel(
      upfirst: upside.map((e) => '${e.trainLineNm}').first,
      downfirst: downside.map((e) => '${e.trainLineNm}').first,
    );
  } else {
    throw Exception('Failed to load arrival in picker data');
  }
});


final filtedarrivalProviderT = FutureProvider.autoDispose<FiltedArrivalModel>((ref) async {

  final name = box.read('nameT');
  final response = await apiservice.getArrival(name!);

  if (response.statusCode == 200) {
    final List<dynamic> jsonBody = jsonDecode(response.body)['realtimeArrivalList'];
    List<ArrivalModel> model =  jsonBody.map((e) => ArrivalModel.fromJson(e)).toList();
    List<ArrivalModel> filtedModel = model.where((e) => e.subwayId == box.read('sublistT')).toList();
    var upside = filtedModel.where((e) => updnLine1.contains(e.updnLine));
    var downside = filtedModel.where((e) => updnLine2.contains(e.updnLine));

    return FiltedArrivalModel(
      upfirst: upside.map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first,
      uplast: upside.map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last,
      downfirst: downside.map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first,
      downlast: downside.map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last,
    );
  } else {
    throw Exception('Failed to load arrivalT data');
  }
});
