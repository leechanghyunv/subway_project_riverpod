import 'package:chopper/chopper.dart';
part 'restApi_room.chopper.dart';

String key = '4c6f72784b6272613735677166456d';

@ChopperApi()
abstract class SeoulApiService extends ChopperService {
  static SeoulApiService create() {
    final client = ChopperClient(
      baseUrl:Uri.parse('http://openapi.seoul.go.kr:8088/$key/json'),
      services: [_$SeoulApiService()],
    );
    return _$SeoulApiService(client);
  }
 /// 미세먼지 데이터
  @Get(path:'/RealtimeCityAir/1/25')
  Future<Response> getDust();
/// 지하철 코드 데이터
  @Get(path:'/SearchInfoBySubwayNameService/1/5/{name}')
  Future<Response> getCode(@Path() String name);
/// 지하철 테이블 데이터
  @Get(path:'/SearchSTNTimeTableByIDService/1/500/{code}/{week}/{updown}')
  Future<Response> getTable(
      @Path() String code,
      @Path() String week,
      @Path() String updown
      );
}

@ChopperApi()
abstract class ArrivalApiService extends ChopperService{
  static ArrivalApiService create(){
    final client = ChopperClient(
      baseUrl: Uri.parse('http://swopenapi.seoul.go.kr/api/subway/$key/json'),
      services: [_$ArrivalApiService()],
    );
    return _$ArrivalApiService(client);
  }
 /// 실시간 열차 도착 데이터
  @Get(path: '/realtimeStationArrival/0/16/{name}')
  Future<Response> getArrival(@Path() String name);
}

@ChopperApi()
abstract class WeatherApiService extends ChopperService{
  static WeatherApiService create(){
    final client = ChopperClient(
      baseUrl: Uri.parse('https://api.openweathermap.org/data/2.5'),
      services: [_$WeatherApiService()],
    );
    return _$WeatherApiService(client);
  }
  /// openweather 날씨 데이터
  @Get(path:'/weather?')
  Future<Response> getWeather(
      @Query('lat') String lat,
      @Query('lon') String lng,
      @Query('appid') String Key,
      );
}