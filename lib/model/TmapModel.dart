import 'package:freezed_annotation/freezed_annotation.dart';
part 'TmapModel.freezed.dart';
part 'TmapModel.g.dart';

@freezed
class Itinerary with _$Itinerary {
  factory Itinerary({
    required Fare fare,
    required int totalTime,
    required List<Leg> legs,
    required int transferCount,
    required int pathType,
  }) = _Itinerary;

  factory Itinerary.fromJson(Map<String, dynamic> json) =>
      _$ItineraryFromJson(json);
}

@freezed
class Fare with _$Fare {
  factory Fare({
    required Regular regular,
  }) = _Fare;

  factory Fare.fromJson(Map<String, dynamic> json) => _$FareFromJson(json);
}

@freezed
class Regular with _$Regular {
  factory Regular({
    required int totalFare,
    required CurrencyClass currency,
  }) = _Regular;

  factory Regular.fromJson(Map<String, dynamic> json) =>
      _$RegularFromJson(json);
}

@freezed
class CurrencyClass with _$CurrencyClass {
  factory CurrencyClass({
    required Symbol symbol,
    required CurrencyEnum currency,
    required CurrencyCode currencyCode,
  }) = _CurrencyClass;

  factory CurrencyClass.fromJson(Map<String, dynamic> json) =>
      _$CurrencyClassFromJson(json);
}

@freezed
class Leg with _$Leg {
  factory Leg({
    required Mode mode,
    required int sectionTime,
    required End start,
    required End end,
    List<Step>? steps,
    String? routeColor,
    String? route,
    PassStopList? passStopList,
    int? type,   /// 숫자별 지하철 호선
    PassShape? passShape,
  }) = _Leg;

  factory Leg.fromJson(Map<String, dynamic> json) => _$LegFromJson(json);
}

@freezed
class End with _$End {
  factory End({
    required String? name,
  }) = _End;

  factory End.fromJson(Map<String, dynamic> json) => _$EndFromJson(json);
}

@freezed
class PassShape with _$PassShape {
  factory PassShape({
    required String? linestring,
  }) = _PassShape;

  factory PassShape.fromJson(Map<String, dynamic> json) =>
      _$PassShapeFromJson(json);
}

@freezed
class PassStopList with _$PassStopList {
  factory PassStopList({
    required List<StationList> stationList,
  }) = _PassStopList;

  factory PassStopList.fromJson(Map<String, dynamic> json) =>
      _$PassStopListFromJson(json);
}

@freezed
class StationList with _$StationList {
  factory StationList({
    required int index,
    required String? stationName,
    required String? stationId,
  }) = _StationList;

  factory StationList.fromJson(Map<String, dynamic> json) =>
      _$StationListFromJson(json);
}

@freezed
class Step with _$Step {
  factory Step({
    required int distance,
    required String? description,
    required String? linestring,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}


enum CurrencyEnum {
  @JsonValue("원")
  EMPTY,
}

enum CurrencyCode {
  @JsonValue("KRW")
  KRW,
}

enum Symbol {
  @JsonValue("￦")
  EMPTY,
}

enum Mode {
  @JsonValue("BUS")
  BUS,
  @JsonValue("SUBWAY")
  SUBWAY,
  @JsonValue("TRANSFER")
  TRANSFER,
  @JsonValue("WALK")
  WALK,
  @JsonValue("TRAIN")
  TRAIN,
  @JsonValue("EXPRESSBUS")
  EXPRESSBUS,
}
