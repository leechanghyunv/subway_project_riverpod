// Project imports:
import 'dart:async';
import 'package:subway_project_230704/setting/export.dart';

class LocationController extends StateNotifier<Position?>{
  LocationController() : super(null);

  Future<void> getlocation() async {
    print('LocationController getlocation');
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {  /// deniedForever
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    print('${position.latitude} ${position.longitude}');
    state = position;
  }
}

final locationProvider = StateNotifierProvider<LocationController,Position?>((ref) {
  return LocationController();
});
