import 'package:subway_project_230704/setting/export.dart';
import 'dart:async';

class MapSample extends ConsumerWidget {

  final double maplat;
  final double maplng;

   MapSample(this.maplat, this.maplng, {super.key});

  late NaverMapController _mapController;
  NaverMapViewOptions options = const NaverMapViewOptions();
  final Completer<NaverMapController> mapControllerCompleter = Completer();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body:  NaverMap(
        options: NaverMapViewOptions(
          mapType: NMapType.basic,
          activeLayerGroups: [NLayerGroup.transit,NLayerGroup.building],
          initialCameraPosition: NCameraPosition(
            target: NLatLng(maplat, maplng),
            zoom: 16,
          ),
          scrollGesturesEnable: true,
          locationButtonEnable: true,
          tiltGesturesEnable: true,
          zoomGesturesEnable: true,
          logoClickEnable: false,
          indoorEnable: true,
          logoAlign: NLogoAlign.leftTop,
        ),
        onMapReady: (controller) async {
          _mapController = controller;
        },
      ),
    );
  }
}
