// Project imports:
import 'package:subway_project_230704/setting/export.dart';

final userNameProvier = StateProvider<String>((ref) => '');
final routeProvider = StateProvider<String>((ref) => '');

final secondRouteProvider = StateProvider<String>((ref) => '');
final secondRoadProvider = StateProvider<String>((ref) => '');
final nameProvider = StateProvider<String>((ref) => 'SEOUL');
final nameProviderT = StateProvider<String>((ref) => '');
final upDownProvider = StateProvider<int>((ref) => 0);
final destination = StateProvider<String>((ref) => '');
/// sublistA
final costProvider = StateProvider<String>((ref) => '0000');
final timeProvider = StateProvider<int>((ref) => 0);
final engNameProvider = StateProvider<String>((ref) => '');
final headingProvider = StateProvider<String>((ref) => 'NNNN');
final codeConveyProvider = StateProvider<String>((ref) => '');
final nameProviderU = StateProvider<String>((ref) => ''); /// in toggle switch
final lineProvider = StateProvider<String>((ref) => 'Line2');
final lineToArrivalProvider = StateProvider<String>((ref) => '');
final convertProvdier = StateProvider<bool>((ref) => false);
final routeListProvider = StateProvider<List<Iterable<String?>?>>((ref) => []);


