// Project imports:
import 'dart:async';
import 'package:subway_project_230704/setting/export.dart';

final locationProvider = StreamProvider.autoDispose<Position?>((ref) {
  final streamController = StreamController<Position?>();
  _determinePosition(streamController);
  return streamController.stream;
});

void _determinePosition(StreamController<Position?> streamController) async {

  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();


  if (!serviceEnabled) {
    streamController.addError('Location services are disabled.');
    return;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      streamController.addError('Location permissions are denied');
      return;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    streamController.addError(
        'Location permissions are permanently denied, we cannot request permissions.');
    return;
  }
  const LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.best,
  );
  Geolocator.getPositionStream(locationSettings: locationSettings)
      .listen((Position position) {
    streamController.add(position);
  });
  Position initialPosition = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  Timer.periodic(Duration(seconds: 35), (timer){
    streamController.add(initialPosition);
  });

}