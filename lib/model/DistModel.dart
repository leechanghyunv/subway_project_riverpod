import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../setting/Export.dart';
import '../setting/Notification.dart';
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

final String key = '8n4clVzOSNpmtywsc27O33eO8rzisc7gPFQwT7SAsj0pvUu6rlclSuW9HNQ2PQgptvsCXVAsOpiMquTrMJzslA%3D%3D';

final apiresult = FutureProvider.family<String,DistModel>((ref,dist) async {

  Noti.initialize(flutterLocalNotificationsPlugin);

  final String Url = 'http://ws.bus.go.kr/api/rest/pathinfo/getPathInfoBySubway?ServiceKey=$key&startX=${dist.lngA}&startY=${dist.latA}&endX=${dist.lngB}&endY=${dist.latB}';

  try{
    final response = await http.get(Uri.parse(Url));
    if(response.statusCode == 200){
      final responseBody = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(responseBody);
      final jsonString = xml2json.toParker();
      var subApiData = jsonDecode(jsonString)["ServiceResult"]["msgBody"]["itemList"]["time"];
      int subTime = int.parse(subApiData);
      noticeTime('${dist.nameA}','${dist.nameB}',subTime);
      return subApiData;

    }
  }catch(e){
    print(e.toString());
    getdata(dist.lngA,dist.latA,dist.lngB,dist.latB,dist.nameA,dist.nameB);
  }
  return '';
});

Future<void> getdata(String lngA,latA,lngB,latB,nameA,nameB) async {
  final String Url = 'http://ws.bus.go.kr/api/rest/pathinfo/getPathInfoBySubway?ServiceKey=$key&startX=${lngA}&startY=${latA}&endX=${lngB}&endY=${latB}';
  print('${lngA}   ${latA}   ${lngB}   ${latB}');
  try {
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      print(response.statusCode);
      final responseBody = response.body;
      final xml2json = Xml2Json();
      xml2json.parse(responseBody);
      final jsonString = xml2json.toParker();
      var subApiData = jsonDecode(
          jsonString)["ServiceResult"]["msgBody"]["itemList"][0]["time"];
      int subTime = int.parse(subApiData);
      noticeTime('$nameA','$nameB',subTime);
      print(subApiData);
    }
  } catch (e) {
    print(e.toString());
  }
}

void noticeTime(String nameA, nameB, int time){
  Get.snackbar(
    '$nameB -> $nameA',
    '소요 시간 $time분',
    mainButton: TextButton(
        onPressed: () {
          Get.closeCurrentSnackbar();
        },
        child: Text('${time}분 후 알람설정')),
    backgroundColor: Colors.white,
    icon: Icon(Icons.subway),
    shouldIconPulse: true,
    duration: Duration(seconds: 3),
  );
  Noti.scheduleNotification(
      title: "목적지에 곧 도착합니다.",
      body: "목적지인 ${nameA}(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
      scheduledNotificationDateTime: DateTime.now().
      add(Duration(minutes: time-2))).then((value) =>
      Noti.scheduleNotification(
          title: "목적지에 곧 도착합니다.",
          body: "목적지인 ${nameA}(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
          scheduledNotificationDateTime: DateTime.now().
          add(Duration(minutes: time-2))));
}