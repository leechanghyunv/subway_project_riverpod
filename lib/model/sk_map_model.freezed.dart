// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sk_map_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Itinerary _$ItineraryFromJson(Map<String, dynamic> json) {
  return _Itinerary.fromJson(json);
}

/// @nodoc
mixin _$Itinerary {
  Fare get fare => throw _privateConstructorUsedError;
  int get totalTime => throw _privateConstructorUsedError;
  List<Leg> get legs => throw _privateConstructorUsedError;
  int get transferCount => throw _privateConstructorUsedError;
  int get pathType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItineraryCopyWith<Itinerary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryCopyWith<$Res> {
  factory $ItineraryCopyWith(Itinerary value, $Res Function(Itinerary) then) =
      _$ItineraryCopyWithImpl<$Res, Itinerary>;
  @useResult
  $Res call(
      {Fare fare,
      int totalTime,
      List<Leg> legs,
      int transferCount,
      int pathType});

  $FareCopyWith<$Res> get fare;
}

/// @nodoc
class _$ItineraryCopyWithImpl<$Res, $Val extends Itinerary>
    implements $ItineraryCopyWith<$Res> {
  _$ItineraryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fare = null,
    Object? totalTime = null,
    Object? legs = null,
    Object? transferCount = null,
    Object? pathType = null,
  }) {
    return _then(_value.copyWith(
      fare: null == fare
          ? _value.fare
          : fare // ignore: cast_nullable_to_non_nullable
              as Fare,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as int,
      legs: null == legs
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Leg>,
      transferCount: null == transferCount
          ? _value.transferCount
          : transferCount // ignore: cast_nullable_to_non_nullable
              as int,
      pathType: null == pathType
          ? _value.pathType
          : pathType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FareCopyWith<$Res> get fare {
    return $FareCopyWith<$Res>(_value.fare, (value) {
      return _then(_value.copyWith(fare: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ItineraryCopyWith<$Res> implements $ItineraryCopyWith<$Res> {
  factory _$$_ItineraryCopyWith(
          _$_Itinerary value, $Res Function(_$_Itinerary) then) =
      __$$_ItineraryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Fare fare,
      int totalTime,
      List<Leg> legs,
      int transferCount,
      int pathType});

  @override
  $FareCopyWith<$Res> get fare;
}

/// @nodoc
class __$$_ItineraryCopyWithImpl<$Res>
    extends _$ItineraryCopyWithImpl<$Res, _$_Itinerary>
    implements _$$_ItineraryCopyWith<$Res> {
  __$$_ItineraryCopyWithImpl(
      _$_Itinerary _value, $Res Function(_$_Itinerary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fare = null,
    Object? totalTime = null,
    Object? legs = null,
    Object? transferCount = null,
    Object? pathType = null,
  }) {
    return _then(_$_Itinerary(
      fare: null == fare
          ? _value.fare
          : fare // ignore: cast_nullable_to_non_nullable
              as Fare,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as int,
      legs: null == legs
          ? _value._legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Leg>,
      transferCount: null == transferCount
          ? _value.transferCount
          : transferCount // ignore: cast_nullable_to_non_nullable
              as int,
      pathType: null == pathType
          ? _value.pathType
          : pathType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Itinerary implements _Itinerary {
  _$_Itinerary(
      {required this.fare,
      required this.totalTime,
      required final List<Leg> legs,
      required this.transferCount,
      required this.pathType})
      : _legs = legs;

  factory _$_Itinerary.fromJson(Map<String, dynamic> json) =>
      _$$_ItineraryFromJson(json);

  @override
  final Fare fare;
  @override
  final int totalTime;
  final List<Leg> _legs;
  @override
  List<Leg> get legs {
    if (_legs is EqualUnmodifiableListView) return _legs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_legs);
  }

  @override
  final int transferCount;
  @override
  final int pathType;

  @override
  String toString() {
    return 'Itinerary(fare: $fare, totalTime: $totalTime, legs: $legs, transferCount: $transferCount, pathType: $pathType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Itinerary &&
            (identical(other.fare, fare) || other.fare == fare) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            const DeepCollectionEquality().equals(other._legs, _legs) &&
            (identical(other.transferCount, transferCount) ||
                other.transferCount == transferCount) &&
            (identical(other.pathType, pathType) ||
                other.pathType == pathType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fare, totalTime,
      const DeepCollectionEquality().hash(_legs), transferCount, pathType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItineraryCopyWith<_$_Itinerary> get copyWith =>
      __$$_ItineraryCopyWithImpl<_$_Itinerary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItineraryToJson(
      this,
    );
  }
}

abstract class _Itinerary implements Itinerary {
  factory _Itinerary(
      {required final Fare fare,
      required final int totalTime,
      required final List<Leg> legs,
      required final int transferCount,
      required final int pathType}) = _$_Itinerary;

  factory _Itinerary.fromJson(Map<String, dynamic> json) =
      _$_Itinerary.fromJson;

  @override
  Fare get fare;
  @override
  int get totalTime;
  @override
  List<Leg> get legs;
  @override
  int get transferCount;
  @override
  int get pathType;
  @override
  @JsonKey(ignore: true)
  _$$_ItineraryCopyWith<_$_Itinerary> get copyWith =>
      throw _privateConstructorUsedError;
}

Fare _$FareFromJson(Map<String, dynamic> json) {
  return _Fare.fromJson(json);
}

/// @nodoc
mixin _$Fare {
  Regular get regular => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FareCopyWith<Fare> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FareCopyWith<$Res> {
  factory $FareCopyWith(Fare value, $Res Function(Fare) then) =
      _$FareCopyWithImpl<$Res, Fare>;
  @useResult
  $Res call({Regular regular});

  $RegularCopyWith<$Res> get regular;
}

/// @nodoc
class _$FareCopyWithImpl<$Res, $Val extends Fare>
    implements $FareCopyWith<$Res> {
  _$FareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
  }) {
    return _then(_value.copyWith(
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as Regular,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RegularCopyWith<$Res> get regular {
    return $RegularCopyWith<$Res>(_value.regular, (value) {
      return _then(_value.copyWith(regular: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FareCopyWith<$Res> implements $FareCopyWith<$Res> {
  factory _$$_FareCopyWith(_$_Fare value, $Res Function(_$_Fare) then) =
      __$$_FareCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Regular regular});

  @override
  $RegularCopyWith<$Res> get regular;
}

/// @nodoc
class __$$_FareCopyWithImpl<$Res> extends _$FareCopyWithImpl<$Res, _$_Fare>
    implements _$$_FareCopyWith<$Res> {
  __$$_FareCopyWithImpl(_$_Fare _value, $Res Function(_$_Fare) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regular = null,
  }) {
    return _then(_$_Fare(
      regular: null == regular
          ? _value.regular
          : regular // ignore: cast_nullable_to_non_nullable
              as Regular,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fare implements _Fare {
  _$_Fare({required this.regular});

  factory _$_Fare.fromJson(Map<String, dynamic> json) => _$$_FareFromJson(json);

  @override
  final Regular regular;

  @override
  String toString() {
    return 'Fare(regular: $regular)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fare &&
            (identical(other.regular, regular) || other.regular == regular));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, regular);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FareCopyWith<_$_Fare> get copyWith =>
      __$$_FareCopyWithImpl<_$_Fare>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FareToJson(
      this,
    );
  }
}

abstract class _Fare implements Fare {
  factory _Fare({required final Regular regular}) = _$_Fare;

  factory _Fare.fromJson(Map<String, dynamic> json) = _$_Fare.fromJson;

  @override
  Regular get regular;
  @override
  @JsonKey(ignore: true)
  _$$_FareCopyWith<_$_Fare> get copyWith => throw _privateConstructorUsedError;
}

Regular _$RegularFromJson(Map<String, dynamic> json) {
  return _Regular.fromJson(json);
}

/// @nodoc
mixin _$Regular {
  int get totalFare => throw _privateConstructorUsedError;
  CurrencyClass get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegularCopyWith<Regular> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegularCopyWith<$Res> {
  factory $RegularCopyWith(Regular value, $Res Function(Regular) then) =
      _$RegularCopyWithImpl<$Res, Regular>;
  @useResult
  $Res call({int totalFare, CurrencyClass currency});

  $CurrencyClassCopyWith<$Res> get currency;
}

/// @nodoc
class _$RegularCopyWithImpl<$Res, $Val extends Regular>
    implements $RegularCopyWith<$Res> {
  _$RegularCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalFare = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      totalFare: null == totalFare
          ? _value.totalFare
          : totalFare // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyClass,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyClassCopyWith<$Res> get currency {
    return $CurrencyClassCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RegularCopyWith<$Res> implements $RegularCopyWith<$Res> {
  factory _$$_RegularCopyWith(
          _$_Regular value, $Res Function(_$_Regular) then) =
      __$$_RegularCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalFare, CurrencyClass currency});

  @override
  $CurrencyClassCopyWith<$Res> get currency;
}

/// @nodoc
class __$$_RegularCopyWithImpl<$Res>
    extends _$RegularCopyWithImpl<$Res, _$_Regular>
    implements _$$_RegularCopyWith<$Res> {
  __$$_RegularCopyWithImpl(_$_Regular _value, $Res Function(_$_Regular) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalFare = null,
    Object? currency = null,
  }) {
    return _then(_$_Regular(
      totalFare: null == totalFare
          ? _value.totalFare
          : totalFare // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyClass,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Regular implements _Regular {
  _$_Regular({required this.totalFare, required this.currency});

  factory _$_Regular.fromJson(Map<String, dynamic> json) =>
      _$$_RegularFromJson(json);

  @override
  final int totalFare;
  @override
  final CurrencyClass currency;

  @override
  String toString() {
    return 'Regular(totalFare: $totalFare, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Regular &&
            (identical(other.totalFare, totalFare) ||
                other.totalFare == totalFare) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalFare, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegularCopyWith<_$_Regular> get copyWith =>
      __$$_RegularCopyWithImpl<_$_Regular>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegularToJson(
      this,
    );
  }
}

abstract class _Regular implements Regular {
  factory _Regular(
      {required final int totalFare,
      required final CurrencyClass currency}) = _$_Regular;

  factory _Regular.fromJson(Map<String, dynamic> json) = _$_Regular.fromJson;

  @override
  int get totalFare;
  @override
  CurrencyClass get currency;
  @override
  @JsonKey(ignore: true)
  _$$_RegularCopyWith<_$_Regular> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrencyClass _$CurrencyClassFromJson(Map<String, dynamic> json) {
  return _CurrencyClass.fromJson(json);
}

/// @nodoc
mixin _$CurrencyClass {
  Symbol get symbol => throw _privateConstructorUsedError;
  CurrencyEnum get currency => throw _privateConstructorUsedError;
  CurrencyCode get currencyCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyClassCopyWith<CurrencyClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyClassCopyWith<$Res> {
  factory $CurrencyClassCopyWith(
          CurrencyClass value, $Res Function(CurrencyClass) then) =
      _$CurrencyClassCopyWithImpl<$Res, CurrencyClass>;
  @useResult
  $Res call({Symbol symbol, CurrencyEnum currency, CurrencyCode currencyCode});
}

/// @nodoc
class _$CurrencyClassCopyWithImpl<$Res, $Val extends CurrencyClass>
    implements $CurrencyClassCopyWith<$Res> {
  _$CurrencyClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? currency = null,
    Object? currencyCode = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as Symbol,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyEnum,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as CurrencyCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyClassCopyWith<$Res>
    implements $CurrencyClassCopyWith<$Res> {
  factory _$$_CurrencyClassCopyWith(
          _$_CurrencyClass value, $Res Function(_$_CurrencyClass) then) =
      __$$_CurrencyClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Symbol symbol, CurrencyEnum currency, CurrencyCode currencyCode});
}

/// @nodoc
class __$$_CurrencyClassCopyWithImpl<$Res>
    extends _$CurrencyClassCopyWithImpl<$Res, _$_CurrencyClass>
    implements _$$_CurrencyClassCopyWith<$Res> {
  __$$_CurrencyClassCopyWithImpl(
      _$_CurrencyClass _value, $Res Function(_$_CurrencyClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? currency = null,
    Object? currencyCode = null,
  }) {
    return _then(_$_CurrencyClass(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as Symbol,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as CurrencyEnum,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as CurrencyCode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyClass implements _CurrencyClass {
  _$_CurrencyClass(
      {required this.symbol,
      required this.currency,
      required this.currencyCode});

  factory _$_CurrencyClass.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyClassFromJson(json);

  @override
  final Symbol symbol;
  @override
  final CurrencyEnum currency;
  @override
  final CurrencyCode currencyCode;

  @override
  String toString() {
    return 'CurrencyClass(symbol: $symbol, currency: $currency, currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyClass &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, symbol, currency, currencyCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyClassCopyWith<_$_CurrencyClass> get copyWith =>
      __$$_CurrencyClassCopyWithImpl<_$_CurrencyClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyClassToJson(
      this,
    );
  }
}

abstract class _CurrencyClass implements CurrencyClass {
  factory _CurrencyClass(
      {required final Symbol symbol,
      required final CurrencyEnum currency,
      required final CurrencyCode currencyCode}) = _$_CurrencyClass;

  factory _CurrencyClass.fromJson(Map<String, dynamic> json) =
      _$_CurrencyClass.fromJson;

  @override
  Symbol get symbol;
  @override
  CurrencyEnum get currency;
  @override
  CurrencyCode get currencyCode;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyClassCopyWith<_$_CurrencyClass> get copyWith =>
      throw _privateConstructorUsedError;
}

Leg _$LegFromJson(Map<String, dynamic> json) {
  return _Leg.fromJson(json);
}

/// @nodoc
mixin _$Leg {
  Mode get mode => throw _privateConstructorUsedError;
  int get sectionTime => throw _privateConstructorUsedError;
  End get start => throw _privateConstructorUsedError;
  End get end => throw _privateConstructorUsedError;
  List<Step>? get steps => throw _privateConstructorUsedError;
  String? get routeColor => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  PassStopList? get passStopList => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;

  /// 숫자별 지하철 호선
  PassShape? get passShape => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LegCopyWith<Leg> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegCopyWith<$Res> {
  factory $LegCopyWith(Leg value, $Res Function(Leg) then) =
      _$LegCopyWithImpl<$Res, Leg>;
  @useResult
  $Res call(
      {Mode mode,
      int sectionTime,
      End start,
      End end,
      List<Step>? steps,
      String? routeColor,
      String? route,
      PassStopList? passStopList,
      int? type,
      PassShape? passShape});

  $EndCopyWith<$Res> get start;
  $EndCopyWith<$Res> get end;
  $PassStopListCopyWith<$Res>? get passStopList;
  $PassShapeCopyWith<$Res>? get passShape;
}

/// @nodoc
class _$LegCopyWithImpl<$Res, $Val extends Leg> implements $LegCopyWith<$Res> {
  _$LegCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? sectionTime = null,
    Object? start = null,
    Object? end = null,
    Object? steps = freezed,
    Object? routeColor = freezed,
    Object? route = freezed,
    Object? passStopList = freezed,
    Object? type = freezed,
    Object? passShape = freezed,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Mode,
      sectionTime: null == sectionTime
          ? _value.sectionTime
          : sectionTime // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as End,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as End,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      routeColor: freezed == routeColor
          ? _value.routeColor
          : routeColor // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      passStopList: freezed == passStopList
          ? _value.passStopList
          : passStopList // ignore: cast_nullable_to_non_nullable
              as PassStopList?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      passShape: freezed == passShape
          ? _value.passShape
          : passShape // ignore: cast_nullable_to_non_nullable
              as PassShape?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EndCopyWith<$Res> get start {
    return $EndCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EndCopyWith<$Res> get end {
    return $EndCopyWith<$Res>(_value.end, (value) {
      return _then(_value.copyWith(end: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PassStopListCopyWith<$Res>? get passStopList {
    if (_value.passStopList == null) {
      return null;
    }

    return $PassStopListCopyWith<$Res>(_value.passStopList!, (value) {
      return _then(_value.copyWith(passStopList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PassShapeCopyWith<$Res>? get passShape {
    if (_value.passShape == null) {
      return null;
    }

    return $PassShapeCopyWith<$Res>(_value.passShape!, (value) {
      return _then(_value.copyWith(passShape: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LegCopyWith<$Res> implements $LegCopyWith<$Res> {
  factory _$$_LegCopyWith(_$_Leg value, $Res Function(_$_Leg) then) =
      __$$_LegCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Mode mode,
      int sectionTime,
      End start,
      End end,
      List<Step>? steps,
      String? routeColor,
      String? route,
      PassStopList? passStopList,
      int? type,
      PassShape? passShape});

  @override
  $EndCopyWith<$Res> get start;
  @override
  $EndCopyWith<$Res> get end;
  @override
  $PassStopListCopyWith<$Res>? get passStopList;
  @override
  $PassShapeCopyWith<$Res>? get passShape;
}

/// @nodoc
class __$$_LegCopyWithImpl<$Res> extends _$LegCopyWithImpl<$Res, _$_Leg>
    implements _$$_LegCopyWith<$Res> {
  __$$_LegCopyWithImpl(_$_Leg _value, $Res Function(_$_Leg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? sectionTime = null,
    Object? start = null,
    Object? end = null,
    Object? steps = freezed,
    Object? routeColor = freezed,
    Object? route = freezed,
    Object? passStopList = freezed,
    Object? type = freezed,
    Object? passShape = freezed,
  }) {
    return _then(_$_Leg(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Mode,
      sectionTime: null == sectionTime
          ? _value.sectionTime
          : sectionTime // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as End,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as End,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      routeColor: freezed == routeColor
          ? _value.routeColor
          : routeColor // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      passStopList: freezed == passStopList
          ? _value.passStopList
          : passStopList // ignore: cast_nullable_to_non_nullable
              as PassStopList?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      passShape: freezed == passShape
          ? _value.passShape
          : passShape // ignore: cast_nullable_to_non_nullable
              as PassShape?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Leg implements _Leg {
  _$_Leg(
      {required this.mode,
      required this.sectionTime,
      required this.start,
      required this.end,
      final List<Step>? steps,
      this.routeColor,
      this.route,
      this.passStopList,
      this.type,
      this.passShape})
      : _steps = steps;

  factory _$_Leg.fromJson(Map<String, dynamic> json) => _$$_LegFromJson(json);

  @override
  final Mode mode;
  @override
  final int sectionTime;
  @override
  final End start;
  @override
  final End end;
  final List<Step>? _steps;
  @override
  List<Step>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? routeColor;
  @override
  final String? route;
  @override
  final PassStopList? passStopList;
  @override
  final int? type;

  /// 숫자별 지하철 호선
  @override
  final PassShape? passShape;

  @override
  String toString() {
    return 'Leg(mode: $mode, sectionTime: $sectionTime, start: $start, end: $end, steps: $steps, routeColor: $routeColor, route: $route, passStopList: $passStopList, type: $type, passShape: $passShape)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Leg &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.sectionTime, sectionTime) ||
                other.sectionTime == sectionTime) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.routeColor, routeColor) ||
                other.routeColor == routeColor) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.passStopList, passStopList) ||
                other.passStopList == passStopList) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.passShape, passShape) ||
                other.passShape == passShape));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mode,
      sectionTime,
      start,
      end,
      const DeepCollectionEquality().hash(_steps),
      routeColor,
      route,
      passStopList,
      type,
      passShape);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LegCopyWith<_$_Leg> get copyWith =>
      __$$_LegCopyWithImpl<_$_Leg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LegToJson(
      this,
    );
  }
}

abstract class _Leg implements Leg {
  factory _Leg(
      {required final Mode mode,
      required final int sectionTime,
      required final End start,
      required final End end,
      final List<Step>? steps,
      final String? routeColor,
      final String? route,
      final PassStopList? passStopList,
      final int? type,
      final PassShape? passShape}) = _$_Leg;

  factory _Leg.fromJson(Map<String, dynamic> json) = _$_Leg.fromJson;

  @override
  Mode get mode;
  @override
  int get sectionTime;
  @override
  End get start;
  @override
  End get end;
  @override
  List<Step>? get steps;
  @override
  String? get routeColor;
  @override
  String? get route;
  @override
  PassStopList? get passStopList;
  @override
  int? get type;
  @override

  /// 숫자별 지하철 호선
  PassShape? get passShape;
  @override
  @JsonKey(ignore: true)
  _$$_LegCopyWith<_$_Leg> get copyWith => throw _privateConstructorUsedError;
}

End _$EndFromJson(Map<String, dynamic> json) {
  return _End.fromJson(json);
}

/// @nodoc
mixin _$End {
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndCopyWith<End> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndCopyWith<$Res> {
  factory $EndCopyWith(End value, $Res Function(End) then) =
      _$EndCopyWithImpl<$Res, End>;
  @useResult
  $Res call({String? name});
}

/// @nodoc
class _$EndCopyWithImpl<$Res, $Val extends End> implements $EndCopyWith<$Res> {
  _$EndCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EndCopyWith<$Res> implements $EndCopyWith<$Res> {
  factory _$$_EndCopyWith(_$_End value, $Res Function(_$_End) then) =
      __$$_EndCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name});
}

/// @nodoc
class __$$_EndCopyWithImpl<$Res> extends _$EndCopyWithImpl<$Res, _$_End>
    implements _$$_EndCopyWith<$Res> {
  __$$_EndCopyWithImpl(_$_End _value, $Res Function(_$_End) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_End(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_End implements _End {
  _$_End({required this.name});

  factory _$_End.fromJson(Map<String, dynamic> json) => _$$_EndFromJson(json);

  @override
  final String? name;

  @override
  String toString() {
    return 'End(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_End &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EndCopyWith<_$_End> get copyWith =>
      __$$_EndCopyWithImpl<_$_End>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EndToJson(
      this,
    );
  }
}

abstract class _End implements End {
  factory _End({required final String? name}) = _$_End;

  factory _End.fromJson(Map<String, dynamic> json) = _$_End.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_EndCopyWith<_$_End> get copyWith => throw _privateConstructorUsedError;
}

PassShape _$PassShapeFromJson(Map<String, dynamic> json) {
  return _PassShape.fromJson(json);
}

/// @nodoc
mixin _$PassShape {
  String? get linestring => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassShapeCopyWith<PassShape> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassShapeCopyWith<$Res> {
  factory $PassShapeCopyWith(PassShape value, $Res Function(PassShape) then) =
      _$PassShapeCopyWithImpl<$Res, PassShape>;
  @useResult
  $Res call({String? linestring});
}

/// @nodoc
class _$PassShapeCopyWithImpl<$Res, $Val extends PassShape>
    implements $PassShapeCopyWith<$Res> {
  _$PassShapeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? linestring = freezed,
  }) {
    return _then(_value.copyWith(
      linestring: freezed == linestring
          ? _value.linestring
          : linestring // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassShapeCopyWith<$Res> implements $PassShapeCopyWith<$Res> {
  factory _$$_PassShapeCopyWith(
          _$_PassShape value, $Res Function(_$_PassShape) then) =
      __$$_PassShapeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? linestring});
}

/// @nodoc
class __$$_PassShapeCopyWithImpl<$Res>
    extends _$PassShapeCopyWithImpl<$Res, _$_PassShape>
    implements _$$_PassShapeCopyWith<$Res> {
  __$$_PassShapeCopyWithImpl(
      _$_PassShape _value, $Res Function(_$_PassShape) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? linestring = freezed,
  }) {
    return _then(_$_PassShape(
      linestring: freezed == linestring
          ? _value.linestring
          : linestring // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PassShape implements _PassShape {
  _$_PassShape({required this.linestring});

  factory _$_PassShape.fromJson(Map<String, dynamic> json) =>
      _$$_PassShapeFromJson(json);

  @override
  final String? linestring;

  @override
  String toString() {
    return 'PassShape(linestring: $linestring)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PassShape &&
            (identical(other.linestring, linestring) ||
                other.linestring == linestring));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, linestring);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassShapeCopyWith<_$_PassShape> get copyWith =>
      __$$_PassShapeCopyWithImpl<_$_PassShape>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassShapeToJson(
      this,
    );
  }
}

abstract class _PassShape implements PassShape {
  factory _PassShape({required final String? linestring}) = _$_PassShape;

  factory _PassShape.fromJson(Map<String, dynamic> json) =
      _$_PassShape.fromJson;

  @override
  String? get linestring;
  @override
  @JsonKey(ignore: true)
  _$$_PassShapeCopyWith<_$_PassShape> get copyWith =>
      throw _privateConstructorUsedError;
}

PassStopList _$PassStopListFromJson(Map<String, dynamic> json) {
  return _PassStopList.fromJson(json);
}

/// @nodoc
mixin _$PassStopList {
  List<StationList> get stationList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassStopListCopyWith<PassStopList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassStopListCopyWith<$Res> {
  factory $PassStopListCopyWith(
          PassStopList value, $Res Function(PassStopList) then) =
      _$PassStopListCopyWithImpl<$Res, PassStopList>;
  @useResult
  $Res call({List<StationList> stationList});
}

/// @nodoc
class _$PassStopListCopyWithImpl<$Res, $Val extends PassStopList>
    implements $PassStopListCopyWith<$Res> {
  _$PassStopListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationList = null,
  }) {
    return _then(_value.copyWith(
      stationList: null == stationList
          ? _value.stationList
          : stationList // ignore: cast_nullable_to_non_nullable
              as List<StationList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassStopListCopyWith<$Res>
    implements $PassStopListCopyWith<$Res> {
  factory _$$_PassStopListCopyWith(
          _$_PassStopList value, $Res Function(_$_PassStopList) then) =
      __$$_PassStopListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StationList> stationList});
}

/// @nodoc
class __$$_PassStopListCopyWithImpl<$Res>
    extends _$PassStopListCopyWithImpl<$Res, _$_PassStopList>
    implements _$$_PassStopListCopyWith<$Res> {
  __$$_PassStopListCopyWithImpl(
      _$_PassStopList _value, $Res Function(_$_PassStopList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationList = null,
  }) {
    return _then(_$_PassStopList(
      stationList: null == stationList
          ? _value._stationList
          : stationList // ignore: cast_nullable_to_non_nullable
              as List<StationList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PassStopList implements _PassStopList {
  _$_PassStopList({required final List<StationList> stationList})
      : _stationList = stationList;

  factory _$_PassStopList.fromJson(Map<String, dynamic> json) =>
      _$$_PassStopListFromJson(json);

  final List<StationList> _stationList;
  @override
  List<StationList> get stationList {
    if (_stationList is EqualUnmodifiableListView) return _stationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stationList);
  }

  @override
  String toString() {
    return 'PassStopList(stationList: $stationList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PassStopList &&
            const DeepCollectionEquality()
                .equals(other._stationList, _stationList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_stationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassStopListCopyWith<_$_PassStopList> get copyWith =>
      __$$_PassStopListCopyWithImpl<_$_PassStopList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassStopListToJson(
      this,
    );
  }
}

abstract class _PassStopList implements PassStopList {
  factory _PassStopList({required final List<StationList> stationList}) =
      _$_PassStopList;

  factory _PassStopList.fromJson(Map<String, dynamic> json) =
      _$_PassStopList.fromJson;

  @override
  List<StationList> get stationList;
  @override
  @JsonKey(ignore: true)
  _$$_PassStopListCopyWith<_$_PassStopList> get copyWith =>
      throw _privateConstructorUsedError;
}

StationList _$StationListFromJson(Map<String, dynamic> json) {
  return _StationList.fromJson(json);
}

/// @nodoc
mixin _$StationList {
  int get index => throw _privateConstructorUsedError;
  String? get stationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'stationID')
  String? get stationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StationListCopyWith<StationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationListCopyWith<$Res> {
  factory $StationListCopyWith(
          StationList value, $Res Function(StationList) then) =
      _$StationListCopyWithImpl<$Res, StationList>;
  @useResult
  $Res call(
      {int index,
      String? stationName,
      @JsonKey(name: 'stationID') String? stationId});
}

/// @nodoc
class _$StationListCopyWithImpl<$Res, $Val extends StationList>
    implements $StationListCopyWith<$Res> {
  _$StationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? stationName = freezed,
    Object? stationId = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      stationName: freezed == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String?,
      stationId: freezed == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StationListCopyWith<$Res>
    implements $StationListCopyWith<$Res> {
  factory _$$_StationListCopyWith(
          _$_StationList value, $Res Function(_$_StationList) then) =
      __$$_StationListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      String? stationName,
      @JsonKey(name: 'stationID') String? stationId});
}

/// @nodoc
class __$$_StationListCopyWithImpl<$Res>
    extends _$StationListCopyWithImpl<$Res, _$_StationList>
    implements _$$_StationListCopyWith<$Res> {
  __$$_StationListCopyWithImpl(
      _$_StationList _value, $Res Function(_$_StationList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? stationName = freezed,
    Object? stationId = freezed,
  }) {
    return _then(_$_StationList(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      stationName: freezed == stationName
          ? _value.stationName
          : stationName // ignore: cast_nullable_to_non_nullable
              as String?,
      stationId: freezed == stationId
          ? _value.stationId
          : stationId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StationList implements _StationList {
  _$_StationList(
      {required this.index,
      this.stationName = "정보없음",
      @JsonKey(name: 'stationID') this.stationId = "정보없음"});

  factory _$_StationList.fromJson(Map<String, dynamic> json) =>
      _$$_StationListFromJson(json);

  @override
  final int index;
  @override
  @JsonKey()
  final String? stationName;
  @override
  @JsonKey(name: 'stationID')
  final String? stationId;

  @override
  String toString() {
    return 'StationList(index: $index, stationName: $stationName, stationId: $stationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StationList &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.stationName, stationName) ||
                other.stationName == stationName) &&
            (identical(other.stationId, stationId) ||
                other.stationId == stationId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, stationName, stationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StationListCopyWith<_$_StationList> get copyWith =>
      __$$_StationListCopyWithImpl<_$_StationList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StationListToJson(
      this,
    );
  }
}

abstract class _StationList implements StationList {
  factory _StationList(
      {required final int index,
      final String? stationName,
      @JsonKey(name: 'stationID') final String? stationId}) = _$_StationList;

  factory _StationList.fromJson(Map<String, dynamic> json) =
      _$_StationList.fromJson;

  @override
  int get index;
  @override
  String? get stationName;
  @override
  @JsonKey(name: 'stationID')
  String? get stationId;
  @override
  @JsonKey(ignore: true)
  _$$_StationListCopyWith<_$_StationList> get copyWith =>
      throw _privateConstructorUsedError;
}

Step _$StepFromJson(Map<String, dynamic> json) {
  return _Step.fromJson(json);
}

/// @nodoc
mixin _$Step {
  int get distance => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get linestring => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepCopyWith<Step> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCopyWith<$Res> {
  factory $StepCopyWith(Step value, $Res Function(Step) then) =
      _$StepCopyWithImpl<$Res, Step>;
  @useResult
  $Res call({int distance, String? description, String? linestring});
}

/// @nodoc
class _$StepCopyWithImpl<$Res, $Val extends Step>
    implements $StepCopyWith<$Res> {
  _$StepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? description = freezed,
    Object? linestring = freezed,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      linestring: freezed == linestring
          ? _value.linestring
          : linestring // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StepCopyWith<$Res> implements $StepCopyWith<$Res> {
  factory _$$_StepCopyWith(_$_Step value, $Res Function(_$_Step) then) =
      __$$_StepCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int distance, String? description, String? linestring});
}

/// @nodoc
class __$$_StepCopyWithImpl<$Res> extends _$StepCopyWithImpl<$Res, _$_Step>
    implements _$$_StepCopyWith<$Res> {
  __$$_StepCopyWithImpl(_$_Step _value, $Res Function(_$_Step) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? description = freezed,
    Object? linestring = freezed,
  }) {
    return _then(_$_Step(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      linestring: freezed == linestring
          ? _value.linestring
          : linestring // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Step implements _Step {
  _$_Step(
      {required this.distance,
      required this.description,
      required this.linestring});

  factory _$_Step.fromJson(Map<String, dynamic> json) => _$$_StepFromJson(json);

  @override
  final int distance;
  @override
  final String? description;
  @override
  final String? linestring;

  @override
  String toString() {
    return 'Step(distance: $distance, description: $description, linestring: $linestring)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Step &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.linestring, linestring) ||
                other.linestring == linestring));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, distance, description, linestring);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StepCopyWith<_$_Step> get copyWith =>
      __$$_StepCopyWithImpl<_$_Step>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepToJson(
      this,
    );
  }
}

abstract class _Step implements Step {
  factory _Step(
      {required final int distance,
      required final String? description,
      required final String? linestring}) = _$_Step;

  factory _Step.fromJson(Map<String, dynamic> json) = _$_Step.fromJson;

  @override
  int get distance;
  @override
  String? get description;
  @override
  String? get linestring;
  @override
  @JsonKey(ignore: true)
  _$$_StepCopyWith<_$_Step> get copyWith => throw _privateConstructorUsedError;
}
