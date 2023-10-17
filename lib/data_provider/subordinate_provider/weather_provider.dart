// Project imports:
import 'package:subway_project_230704/setting/export.dart';
import '../../repository/geolocator.dart';

/// 날씨정보

final apiservice = WeatherApiService.create();

final weatherProvider = FutureProvider.autoDispose<List<Weather>>((ref) async {

  final location = ref.watch(locationProvider);

  if(location!= null){

    var lat = location.latitude.toString();
    var lng = location.longitude.toString();

    final response = await apiservice.getWeather(lat, lng, weatherKey);
    if(response.statusCode == 200){
      final List<dynamic> jsonBody = jsonDecode(response.body)['weather'];
      print(jsonBody);
      return jsonBody.map((e) => Weather.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load Weather data');
    }
  }
  throw Exception('Failed to load Weather data');
});

/// 온도 데이터

final tempProvider = FutureProvider.autoDispose<Main>((ref) async {

  final location = ref.watch(locationProvider);

  if(location!= null){

    var lat = location.latitude.toString();
    var lng = location.longitude.toString();

    final response = await apiservice.getWeather(lat, lng, weatherKey);

    if(response.statusCode == 200){
      final Map<String, Object?> jsonBody = jsonDecode(response.body)['main'];
      print(jsonBody);
      return Main.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load Main data');
    }
  }
  throw Exception('Failed to load Main data');
});

/// 날씨정보에 따른 아이콘 변경

final svgProvider = FutureProvider.autoDispose<Widget>((ref){

  final weather = ref.watch(weatherProvider);
  final condition = weather.value?.elementAt(0).id;

  if(condition != null){
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-colud_lightning.svg',
        color: Colors.black,
        height: 35,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
        color: Colors.black,
        height: 35,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black,
        height: 35,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black,
        height: 35,
      );
    }
    throw Exception('Failed to load user data');
  }
  return SvgPicture.asset(
    'svg/icon.svg',
    color: Colors.black,
    height: 35,
  );

});
