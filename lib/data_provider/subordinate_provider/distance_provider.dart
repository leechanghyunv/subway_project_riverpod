// Package imports:
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

// Project imports:
import '../../../setting/export+.dart';
import '../../../setting/export.dart';

/// 출발지점 도착지점의 파라미터를 받은 후에 최적의 이동경로, 도착 예상시간을 필터링, 도착예상시간전에 알림기능
/// 제이슨 데이터가 상당히 네스팅구간이 많아서 복잡함 유료데이터임

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

final skapiservice = SkOpenApiService.create();

final apiresult = FutureProvider.family<List<Itinerary>,DistModel>((ref,dist) async {

  Noti.initialize(flutterLocalNotificationsPlugin);

  try{
    final url = Uri.parse('http://apis.openapi.sk.com/transit/routes');

    final headers = {
      'accept': 'application/json', 'appKey': skKey, 'content-type': 'application/json',
    };

    final body = jsonEncode({
      'startX': dist.lngB, 'startY': dist.latB, 'endX': dist.lngA, 'endY': dist.latA, "lang": 0, "format": "json", "count": 20
    });

    final response = await http.post(url, headers: headers, body: body);
    if(response.statusCode == 200){
      final Map<String, dynamic> utf8String = jsonDecode(Utf8Decoder().convert(response.bodyBytes))['metaData']['plan'];
      List<Itinerary> utfIntoList = utf8String['itineraries'].map<Itinerary>((e) => Itinerary.fromJson(e)).toList();
      utfIntoList.sort((a,b)=> a.totalTime.compareTo(b.totalTime));

      if(utfIntoList.any((element) => element.pathType == 1)){
        var info = utfIntoList.where((element) => element.pathType == 1);
        var route =info.first.legs.map((e) => '${e.end.name}').toSet().toList();
        String formattedRoute = route.join(' > ');
        ref.read(routeProvider.notifier).state = formattedRoute;

        var ListFiltered1 = info.map((e) => '${(e.totalTime/60).toStringAsFixed(0)}분' ).toList();

        print('totalSubTimeList: $ListFiltered1');

        var time = info.first.totalTime; /// 지하철기준 시간순
        ref.read(timeProvider.notifier).state = time;
        NoticeTime(dist.nameA,dist.nameB,formattedRoute,time);
        /// 상행선일까 하행선일까 상행선일까 하행선일까 구분/// /// /// /// /// /// /// /// /// /// ///
        var subId = info.first.legs.where((e) => e.route != null).map((e) => e.passStopList?.stationList.map((e) => e.stationId));

        var subName = info.first.legs.where((e) => e.route != null).
        map((e) => e.passStopList?.stationList.map((e) => e.stationName)).toList();
        ref.read(routeListProvider.notifier).state = subName.toList();

        var firstElement = subId.elementAt(0);
        print('firstElement : $firstElement');
        var value1 = firstElement?.elementAt(0);
        var value2 = firstElement?.elementAt(1);
        print('value1 : $value1 value2 : $value2');
        int? intValue1 = int.tryParse(value1!);
        int? intValue2 = int.tryParse(value2!);

        if(intValue1 != null && intValue2 != null){
          print('${intValue1-intValue2}'); // 1이면 상행 -1이면 하행
          ref.read(upDownProvider.notifier).state = (intValue1-intValue2);
          print('route: $subName');
        }
        /// 요금정보 /// /// /// //// /// /// /// //// /// /// /// //// /// /// /// //// /// /// /// /
        var fare = utfIntoList.where((element) => element.pathType == 1).first.fare.regular.totalFare;
        ref.read(costProvider.notifier).state = fare.toString();
        return utfIntoList;
      } else {
        var pathtype = utfIntoList.first.pathType.toString();
        var routename = utfIntoList.first.legs.map((e) => '${e.route}').where((e) => e != 'null').toSet().toList();
        var fare = utfIntoList.where((element) => element.pathType != 1).first.fare.regular.totalFare;
        var route = utfIntoList.first.legs.map((e) => '${e.end.name}').toSet().toList();
        String formattedRoute = route.join(' > ');
        String formattedpathtype = routename.join(' - ');

        ref.read(secondRouteProvider.notifier).state = formattedpathtype;
        ref.read(secondRoadProvider.notifier).state = formattedRoute;
        var time = utfIntoList.first.totalTime; ///  시간순
        ref.read(timeProvider.notifier).state = time;
        ref.read(costProvider.notifier).state = fare.toString();
        NoticeTime(dist.nameA,dist.nameB,formattedRoute,time);
        getAnotherNotice(time,pathtype,formattedpathtype,formattedRoute);
      }
    }
    throw('distance_calculate: ${response.statusCode}');
  }catch(e){
    throw(e.toString());
  }
});

void NoticeTime(String nameA, nameB,route, int time){
  getNoticeTime(nameA, nameB, route, time);

  Noti.scheduleNotification(
      title: "목적지에 곧 도착합니다.",
      body: "목적지인 $nameA(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
      scheduledNotificationDateTime: DateTime.now().
      add(Duration(minutes: time-120))).then((value) =>
      Noti.scheduleNotification(
          title: "목적지에 곧 도착합니다.",
          body: "목적지인 $nameA(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
          scheduledNotificationDateTime: DateTime.now().
          add(Duration(seconds: time-120))));
  Noti.scheduleNotification(
      title: "목적지에 곧 도착합니다.",
      body: "목적지인 $nameA(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
      scheduledNotificationDateTime: DateTime.now().
      add(Duration(seconds: time-120)));
}

