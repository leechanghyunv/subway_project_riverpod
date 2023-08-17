import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNameProvier = StateProvider<String>((ref) => '');
final routeProvider = StateProvider<String>((ref) => '');
final secondRouteProvider = StateProvider<String>((ref) => '');
final nameProvier = StateProvider<String>((ref) => 'SEOUL');
final nameProvierT = StateProvider<String>((ref) => '');
final upDownProvider = StateProvider<int>((ref) => 0);
final destination = StateProvider<String>((ref) => '');
/// sublistA
final costProvider = StateProvider<String>((ref) => '');
final timeProvider = StateProvider<int>((ref) => 0);
final engNameProvier = StateProvider<String>((ref) => '');
final headingProvider = StateProvider<String>((ref) => 'NNNN');
final codeConveyProvider = StateProvider<String>((ref) => '');
final nameProvierU = StateProvider<String>((ref) => ''); /// in toggle switch
final lineProvier = StateProvider<String>((ref) => 'Line2');
final convertProvier = StateProvider<bool>((ref) => false);



