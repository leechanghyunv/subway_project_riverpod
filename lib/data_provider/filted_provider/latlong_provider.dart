// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

/// 현재위치와 데이터에 저장된 위도,경도값을 비교해 디바이스와 가까운 지하철역 순으로 리스팅하는 프로바이더
final latlngProvider = FutureProvider.autoDispose<List<SubwayModel>>
  ((ref) async {

  final Distance _distance =  Distance();

  final location = ref.watch(locationProvider);
  final line = ref.watch(latlonglineProvier);
  final data = ref.watch(dataProviderInside);

  data.whenData((value){
      for (var i = 0; i < data.value!.length; i++) {
        final km = _distance.as(
            LengthUnit.Meter,
            LatLng(location!.latitude, location!.longitude),
            LatLng(data.value![i].lat, data.value![i].lng));
        data.value![i] = data.value![i].setKm(km);
      }
  });

  data.value!.sort((a, b) => a.km!.compareTo(b.km!));
  return data.value!.where((element) => element.line_ui.contains(
      line)).toList();
});


