// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

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
            LatLng(location.value!.latitude, location.value!.longitude),
            LatLng(data.value![i].lat, data.value![i].lng));
        data.value![i] = data.value![i].setKm(km);
      }


  });

  data.value!.sort((a, b) => a.km!.compareTo(b.km!));
  return data.value!.where((element) => element.line_ui.contains(
      line)).toList();
});


