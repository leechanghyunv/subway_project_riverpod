import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import '../setting/Notification.dart';
import '../setting/Export.dart';
import 'TmapModel.dart';
import 'dart:convert';
part 'DistModel.freezed.dart';
part 'DistModel.g.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

@Freezed()
class DistModel with _$DistModel{
  const factory DistModel({
    @Default("정보없음") String latA,
    @Default("정보없음") String lngA,
    @Default("정보없음") String nameA,
    @Default("정보없음") String latB,
    @Default("정보없음") String lngB,
    @Default("정보없음") String nameB,
  }) = _DistModel;
  factory DistModel.fromJson(Map<String, Object?> json) => _$DistModelFromJson(json);
}

final String APIKEY = 'ceevGND92fauEWQ8gfEnJ2i2gTlX1sxT2DBh3XRh';

final apiresult = FutureProvider.family<List<Itinerary>,DistModel>((ref,dist) async {

  Noti.initialize(flutterLocalNotificationsPlugin);

  try{
    final url = Uri.parse('http://apis.openapi.sk.com/transit/routes');
    final headers = {
      'accept': 'application/json',
      'appKey': '$APIKEY',
      'content-type': 'application/json',
    };
    final body = jsonEncode({
      'startX': '${dist.lngB}',
      'startY': '${dist.latB}',
      'endX': '${dist.lngA}',
      'endY': '${dist.latA}',
      "lang": 0,
      "format": "json",
      "count": 10
    });
    final response = await http.post(url, headers: headers, body: body);
    if(response.statusCode == 200){
      final Map<String, dynamic> utf8String = jsonDecode(Utf8Decoder().convert(response.bodyBytes))['metaData']['plan'];
      List<Itinerary> utfIntoList = utf8String['itineraries'].map<Itinerary>((e) => Itinerary.fromJson(e)).toList();
      utfIntoList.sort((a,b)=> a.totalTime.compareTo(b.totalTime));

      if(utfIntoList.any((element) => element.pathType == 1)){
        var route = utfIntoList.where((element) => element.pathType == 1).first.legs.
        map((e) => '${e.end.name}').toSet().toList();
        String formattedRoute = route.join(' > ');
        ref.read(routeProvider.notifier).state = formattedRoute;
        var ListFiltered1 = utfIntoList.where((element) => element.pathType == 1).
        map((e) => '${(e.totalTime/60).toStringAsFixed(0)}분' ).toList();
        print('totalSubTimeList: ${ListFiltered1}');
        var Time = utfIntoList.where((element) => element.pathType == 1).first.totalTime; /// 지하철기준 시간순
        noticeTime(dist.nameA,dist.nameB,formattedRoute,Time);
        return utfIntoList;
      }

      /// pathType 1-지하철, pathType 2-버스, pathType 3-버스+지하철
      var pathtype = utfIntoList.first.pathType.toString();
      var routename = utfIntoList.first.legs.map((e) => '${e.route}').toSet().toList();
      var route = utfIntoList.first.legs.map((e) => '${e.end.name}').toSet().toList();
      String formattedRoute = route.join(' > ');
      String formattedpathtype = routename.join(' - ');
      var Time = utfIntoList.first.totalTime; ///  시간순
      Get.snackbar(
        '(지하철기준) 적합한 경로가 없습니다.',
        '빠른경로 ${pathtype == '2' ? '버스' : pathtype == '3' ? '버스-지하철' : '---'} : ${formattedpathtype}\n${formattedRoute}\n${(Time/60).toStringAsFixed(0)}분 소요',
        backgroundColor: Colors.grey[100],
        shouldIconPulse: true,
        duration: Duration(seconds: 7),
      );

    }
    throw('Error');
  }catch(e){
    throw(e.toString());
  }
});

void noticeTime(String nameA, nameB,route, int time){
  Get.snackbar(
    '$nameB -> $nameA (${(time/60).toStringAsFixed(0)}분 소요)',
    '도착 시간 2분전에 알람 울릴께요.\n\n이동경로 : ${route}',
    backgroundColor: Colors.grey[100],
    icon: Icon(Icons.subway),
    shouldIconPulse: true,
    duration: Duration(seconds: 7),
  );
  Noti.scheduleNotification(
      title: "목적지에 곧 도착합니다.",
      body: "목적지인 ${nameA}(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
      scheduledNotificationDateTime: DateTime.now().
      add(Duration(minutes: time-120))).then((value) =>
      Noti.scheduleNotification(
          title: "목적지에 곧 도착합니다.",
          body: "목적지인 ${nameA}(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
          scheduledNotificationDateTime: DateTime.now().
          add(Duration(seconds: time-120))));
}