// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sk_map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Itinerary _$$_ItineraryFromJson(Map<String, dynamic> json) => _$_Itinerary(
      fare: Fare.fromJson(json['fare'] as Map<String, dynamic>),
      totalTime: json['totalTime'] as int,
      legs: (json['legs'] as List<dynamic>)
          .map((e) => Leg.fromJson(e as Map<String, dynamic>))
          .toList(),
      transferCount: json['transferCount'] as int,
      pathType: json['pathType'] as int,
    );

Map<String, dynamic> _$$_ItineraryToJson(_$_Itinerary instance) =>
    <String, dynamic>{
      'fare': instance.fare,
      'totalTime': instance.totalTime,
      'legs': instance.legs,
      'transferCount': instance.transferCount,
      'pathType': instance.pathType,
    };

_$_Fare _$$_FareFromJson(Map<String, dynamic> json) => _$_Fare(
      regular: Regular.fromJson(json['regular'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FareToJson(_$_Fare instance) => <String, dynamic>{
      'regular': instance.regular,
    };

_$_Regular _$$_RegularFromJson(Map<String, dynamic> json) => _$_Regular(
      totalFare: json['totalFare'] as int,
      currency:
          CurrencyClass.fromJson(json['currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RegularToJson(_$_Regular instance) =>
    <String, dynamic>{
      'totalFare': instance.totalFare,
      'currency': instance.currency,
    };

_$_CurrencyClass _$$_CurrencyClassFromJson(Map<String, dynamic> json) =>
    _$_CurrencyClass(
      symbol: $enumDecode(_$SymbolEnumMap, json['symbol']),
      currency: $enumDecode(_$CurrencyEnumEnumMap, json['currency']),
      currencyCode: $enumDecode(_$CurrencyCodeEnumMap, json['currencyCode']),
    );

Map<String, dynamic> _$$_CurrencyClassToJson(_$_CurrencyClass instance) =>
    <String, dynamic>{
      'symbol': _$SymbolEnumMap[instance.symbol]!,
      'currency': _$CurrencyEnumEnumMap[instance.currency]!,
      'currencyCode': _$CurrencyCodeEnumMap[instance.currencyCode]!,
    };

const _$SymbolEnumMap = {
  Symbol.EMPTY: '￦',
};

const _$CurrencyEnumEnumMap = {
  CurrencyEnum.EMPTY: '원',
};

const _$CurrencyCodeEnumMap = {
  CurrencyCode.KRW: 'KRW',
};

_$_Leg _$$_LegFromJson(Map<String, dynamic> json) => _$_Leg(
      mode: $enumDecode(_$ModeEnumMap, json['mode']),
      sectionTime: json['sectionTime'] as int,
      start: End.fromJson(json['start'] as Map<String, dynamic>),
      end: End.fromJson(json['end'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeColor: json['routeColor'] as String?,
      route: json['route'] as String?,
      passStopList: json['passStopList'] == null
          ? null
          : PassStopList.fromJson(json['passStopList'] as Map<String, dynamic>),
      type: json['type'] as int?,
      passShape: json['passShape'] == null
          ? null
          : PassShape.fromJson(json['passShape'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LegToJson(_$_Leg instance) => <String, dynamic>{
      'mode': _$ModeEnumMap[instance.mode]!,
      'sectionTime': instance.sectionTime,
      'start': instance.start,
      'end': instance.end,
      'steps': instance.steps,
      'routeColor': instance.routeColor,
      'route': instance.route,
      'passStopList': instance.passStopList,
      'type': instance.type,
      'passShape': instance.passShape,
    };

const _$ModeEnumMap = {
  Mode.BUS: 'BUS',
  Mode.SUBWAY: 'SUBWAY',
  Mode.TRANSFER: 'TRANSFER',
  Mode.WALK: 'WALK',
  Mode.TRAIN: 'TRAIN',
  Mode.EXPRESSBUS: 'EXPRESSBUS',
};

_$_End _$$_EndFromJson(Map<String, dynamic> json) => _$_End(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_EndToJson(_$_End instance) => <String, dynamic>{
      'name': instance.name,
    };

_$_PassShape _$$_PassShapeFromJson(Map<String, dynamic> json) => _$_PassShape(
      linestring: json['linestring'] as String?,
    );

Map<String, dynamic> _$$_PassShapeToJson(_$_PassShape instance) =>
    <String, dynamic>{
      'linestring': instance.linestring,
    };

_$_PassStopList _$$_PassStopListFromJson(Map<String, dynamic> json) =>
    _$_PassStopList(
      stationList: (json['stationList'] as List<dynamic>)
          .map((e) => StationList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PassStopListToJson(_$_PassStopList instance) =>
    <String, dynamic>{
      'stationList': instance.stationList,
    };

_$_StationList _$$_StationListFromJson(Map<String, dynamic> json) =>
    _$_StationList(
      index: json['index'] as int? ?? 000000,
      stationName: json['stationName'] as String? ?? "정보없음",
      stationId: json['stationID'] as String? ?? "정보없음",
    );

Map<String, dynamic> _$$_StationListToJson(_$_StationList instance) =>
    <String, dynamic>{
      'index': instance.index,
      'stationName': instance.stationName,
      'stationID': instance.stationId,
    };

_$_Step _$$_StepFromJson(Map<String, dynamic> json) => _$_Step(
      distance: json['distance'] as int,
      description: json['description'] as String?,
      linestring: json['linestring'] as String?,
    );

Map<String, dynamic> _$$_StepToJson(_$_Step instance) => <String, dynamic>{
      'distance': instance.distance,
      'description': instance.description,
      'linestring': instance.linestring,
    };
