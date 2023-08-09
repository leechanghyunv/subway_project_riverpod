import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
