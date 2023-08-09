// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restApi_room.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$SeoulApiService extends SeoulApiService {
  _$SeoulApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SeoulApiService;

  @override
  Future<Response<dynamic>> getDust() {
    final Uri $url = Uri.parse('/RealtimeCityAir/1/25');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCode(String name) {
    final Uri $url = Uri.parse('/SearchInfoBySubwayNameService/1/5/${name}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getTable(
    String code,
    String week,
    String updown,
  ) {
    final Uri $url = Uri.parse(
        '/SearchSTNTimeTableByIDService/1/500/${code}/${week}/${updown}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ArrivalApiService extends ArrivalApiService {
  _$ArrivalApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ArrivalApiService;

  @override
  Future<Response<dynamic>> getArrival(String name) {
    final Uri $url = Uri.parse('/realtimeStationArrival/0/16/${name}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$WeatherApiService extends WeatherApiService {
  _$WeatherApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = WeatherApiService;

  @override
  Future<Response<dynamic>> getWeather(
    String lat,
    String lng,
    String Key,
  ) {
    final Uri $url = Uri.parse('/weather?');
    final Map<String, dynamic> $params = <String, dynamic>{
      'lat': lat,
      'lon': lng,
      'appid': Key,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
