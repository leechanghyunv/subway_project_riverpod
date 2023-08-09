// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arrival_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArrivalModel _$ArrivalModelFromJson(Map<String, dynamic> json) {
  return _ArrivalModel.fromJson(json);
}

/// @nodoc
mixin _$ArrivalModel {
  String get subwayId => throw _privateConstructorUsedError;

  /// 호선번호 1001,1002 ~~
  String get updnLine => throw _privateConstructorUsedError;

  /// 상행,하행,내선,외선
  String get trainLineNm => throw _privateConstructorUsedError;

  /// "방화행 - 마장방면",
  String get statnFid => throw _privateConstructorUsedError;

  /// 이전지하철역ID - 1004 00 0427 - 4호선 회현 0427
  String get statnTid => throw _privateConstructorUsedError;

  /// 다음지하철역ID - 1004 00 0425
  String get statnId => throw _privateConstructorUsedError;

  /// 지하철역ID - 1004 00 0426
  String get statnNm => throw _privateConstructorUsedError;

  /// 지하철역명
  String get subwayList => throw _privateConstructorUsedError;

  /// 지하철역 호선 리스트 "1001,1004,1063,1065",
  String get btrainSttus => throw _privateConstructorUsedError;

  /// ITX(T), 급행(EXP(S)), 일반(NOR(S))
  String get btrainNo => throw _privateConstructorUsedError;

  /// 열차번호
  String get bstatnNm => throw _privateConstructorUsedError;

  /// 종착
  String get arvlMsg2 => throw _privateConstructorUsedError;

  /// 도착메시지
  String get arvlCd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArrivalModelCopyWith<ArrivalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArrivalModelCopyWith<$Res> {
  factory $ArrivalModelCopyWith(
          ArrivalModel value, $Res Function(ArrivalModel) then) =
      _$ArrivalModelCopyWithImpl<$Res, ArrivalModel>;
  @useResult
  $Res call(
      {String subwayId,
      String updnLine,
      String trainLineNm,
      String statnFid,
      String statnTid,
      String statnId,
      String statnNm,
      String subwayList,
      String btrainSttus,
      String btrainNo,
      String bstatnNm,
      String arvlMsg2,
      String arvlCd});
}

/// @nodoc
class _$ArrivalModelCopyWithImpl<$Res, $Val extends ArrivalModel>
    implements $ArrivalModelCopyWith<$Res> {
  _$ArrivalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subwayId = null,
    Object? updnLine = null,
    Object? trainLineNm = null,
    Object? statnFid = null,
    Object? statnTid = null,
    Object? statnId = null,
    Object? statnNm = null,
    Object? subwayList = null,
    Object? btrainSttus = null,
    Object? btrainNo = null,
    Object? bstatnNm = null,
    Object? arvlMsg2 = null,
    Object? arvlCd = null,
  }) {
    return _then(_value.copyWith(
      subwayId: null == subwayId
          ? _value.subwayId
          : subwayId // ignore: cast_nullable_to_non_nullable
              as String,
      updnLine: null == updnLine
          ? _value.updnLine
          : updnLine // ignore: cast_nullable_to_non_nullable
              as String,
      trainLineNm: null == trainLineNm
          ? _value.trainLineNm
          : trainLineNm // ignore: cast_nullable_to_non_nullable
              as String,
      statnFid: null == statnFid
          ? _value.statnFid
          : statnFid // ignore: cast_nullable_to_non_nullable
              as String,
      statnTid: null == statnTid
          ? _value.statnTid
          : statnTid // ignore: cast_nullable_to_non_nullable
              as String,
      statnId: null == statnId
          ? _value.statnId
          : statnId // ignore: cast_nullable_to_non_nullable
              as String,
      statnNm: null == statnNm
          ? _value.statnNm
          : statnNm // ignore: cast_nullable_to_non_nullable
              as String,
      subwayList: null == subwayList
          ? _value.subwayList
          : subwayList // ignore: cast_nullable_to_non_nullable
              as String,
      btrainSttus: null == btrainSttus
          ? _value.btrainSttus
          : btrainSttus // ignore: cast_nullable_to_non_nullable
              as String,
      btrainNo: null == btrainNo
          ? _value.btrainNo
          : btrainNo // ignore: cast_nullable_to_non_nullable
              as String,
      bstatnNm: null == bstatnNm
          ? _value.bstatnNm
          : bstatnNm // ignore: cast_nullable_to_non_nullable
              as String,
      arvlMsg2: null == arvlMsg2
          ? _value.arvlMsg2
          : arvlMsg2 // ignore: cast_nullable_to_non_nullable
              as String,
      arvlCd: null == arvlCd
          ? _value.arvlCd
          : arvlCd // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArrivalModelCopyWith<$Res>
    implements $ArrivalModelCopyWith<$Res> {
  factory _$$_ArrivalModelCopyWith(
          _$_ArrivalModel value, $Res Function(_$_ArrivalModel) then) =
      __$$_ArrivalModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subwayId,
      String updnLine,
      String trainLineNm,
      String statnFid,
      String statnTid,
      String statnId,
      String statnNm,
      String subwayList,
      String btrainSttus,
      String btrainNo,
      String bstatnNm,
      String arvlMsg2,
      String arvlCd});
}

/// @nodoc
class __$$_ArrivalModelCopyWithImpl<$Res>
    extends _$ArrivalModelCopyWithImpl<$Res, _$_ArrivalModel>
    implements _$$_ArrivalModelCopyWith<$Res> {
  __$$_ArrivalModelCopyWithImpl(
      _$_ArrivalModel _value, $Res Function(_$_ArrivalModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subwayId = null,
    Object? updnLine = null,
    Object? trainLineNm = null,
    Object? statnFid = null,
    Object? statnTid = null,
    Object? statnId = null,
    Object? statnNm = null,
    Object? subwayList = null,
    Object? btrainSttus = null,
    Object? btrainNo = null,
    Object? bstatnNm = null,
    Object? arvlMsg2 = null,
    Object? arvlCd = null,
  }) {
    return _then(_$_ArrivalModel(
      subwayId: null == subwayId
          ? _value.subwayId
          : subwayId // ignore: cast_nullable_to_non_nullable
              as String,
      updnLine: null == updnLine
          ? _value.updnLine
          : updnLine // ignore: cast_nullable_to_non_nullable
              as String,
      trainLineNm: null == trainLineNm
          ? _value.trainLineNm
          : trainLineNm // ignore: cast_nullable_to_non_nullable
              as String,
      statnFid: null == statnFid
          ? _value.statnFid
          : statnFid // ignore: cast_nullable_to_non_nullable
              as String,
      statnTid: null == statnTid
          ? _value.statnTid
          : statnTid // ignore: cast_nullable_to_non_nullable
              as String,
      statnId: null == statnId
          ? _value.statnId
          : statnId // ignore: cast_nullable_to_non_nullable
              as String,
      statnNm: null == statnNm
          ? _value.statnNm
          : statnNm // ignore: cast_nullable_to_non_nullable
              as String,
      subwayList: null == subwayList
          ? _value.subwayList
          : subwayList // ignore: cast_nullable_to_non_nullable
              as String,
      btrainSttus: null == btrainSttus
          ? _value.btrainSttus
          : btrainSttus // ignore: cast_nullable_to_non_nullable
              as String,
      btrainNo: null == btrainNo
          ? _value.btrainNo
          : btrainNo // ignore: cast_nullable_to_non_nullable
              as String,
      bstatnNm: null == bstatnNm
          ? _value.bstatnNm
          : bstatnNm // ignore: cast_nullable_to_non_nullable
              as String,
      arvlMsg2: null == arvlMsg2
          ? _value.arvlMsg2
          : arvlMsg2 // ignore: cast_nullable_to_non_nullable
              as String,
      arvlCd: null == arvlCd
          ? _value.arvlCd
          : arvlCd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArrivalModel implements _ArrivalModel {
  const _$_ArrivalModel(
      {this.subwayId = "정보없음",
      this.updnLine = "정보없음",
      this.trainLineNm = "정보없음",
      this.statnFid = "정보없음",
      this.statnTid = "정보없음",
      this.statnId = "정보없음",
      this.statnNm = "정보없음",
      this.subwayList = "정보없음",
      this.btrainSttus = "정보없음",
      this.btrainNo = "정보없음",
      this.bstatnNm = "정보없음",
      this.arvlMsg2 = "정보없음",
      this.arvlCd = "정보없음"});

  factory _$_ArrivalModel.fromJson(Map<String, dynamic> json) =>
      _$$_ArrivalModelFromJson(json);

  @override
  @JsonKey()
  final String subwayId;

  /// 호선번호 1001,1002 ~~
  @override
  @JsonKey()
  final String updnLine;

  /// 상행,하행,내선,외선
  @override
  @JsonKey()
  final String trainLineNm;

  /// "방화행 - 마장방면",
  @override
  @JsonKey()
  final String statnFid;

  /// 이전지하철역ID - 1004 00 0427 - 4호선 회현 0427
  @override
  @JsonKey()
  final String statnTid;

  /// 다음지하철역ID - 1004 00 0425
  @override
  @JsonKey()
  final String statnId;

  /// 지하철역ID - 1004 00 0426
  @override
  @JsonKey()
  final String statnNm;

  /// 지하철역명
  @override
  @JsonKey()
  final String subwayList;

  /// 지하철역 호선 리스트 "1001,1004,1063,1065",
  @override
  @JsonKey()
  final String btrainSttus;

  /// ITX(T), 급행(EXP(S)), 일반(NOR(S))
  @override
  @JsonKey()
  final String btrainNo;

  /// 열차번호
  @override
  @JsonKey()
  final String bstatnNm;

  /// 종착
  @override
  @JsonKey()
  final String arvlMsg2;

  /// 도착메시지
  @override
  @JsonKey()
  final String arvlCd;

  @override
  String toString() {
    return 'ArrivalModel(subwayId: $subwayId, updnLine: $updnLine, trainLineNm: $trainLineNm, statnFid: $statnFid, statnTid: $statnTid, statnId: $statnId, statnNm: $statnNm, subwayList: $subwayList, btrainSttus: $btrainSttus, btrainNo: $btrainNo, bstatnNm: $bstatnNm, arvlMsg2: $arvlMsg2, arvlCd: $arvlCd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArrivalModel &&
            (identical(other.subwayId, subwayId) ||
                other.subwayId == subwayId) &&
            (identical(other.updnLine, updnLine) ||
                other.updnLine == updnLine) &&
            (identical(other.trainLineNm, trainLineNm) ||
                other.trainLineNm == trainLineNm) &&
            (identical(other.statnFid, statnFid) ||
                other.statnFid == statnFid) &&
            (identical(other.statnTid, statnTid) ||
                other.statnTid == statnTid) &&
            (identical(other.statnId, statnId) || other.statnId == statnId) &&
            (identical(other.statnNm, statnNm) || other.statnNm == statnNm) &&
            (identical(other.subwayList, subwayList) ||
                other.subwayList == subwayList) &&
            (identical(other.btrainSttus, btrainSttus) ||
                other.btrainSttus == btrainSttus) &&
            (identical(other.btrainNo, btrainNo) ||
                other.btrainNo == btrainNo) &&
            (identical(other.bstatnNm, bstatnNm) ||
                other.bstatnNm == bstatnNm) &&
            (identical(other.arvlMsg2, arvlMsg2) ||
                other.arvlMsg2 == arvlMsg2) &&
            (identical(other.arvlCd, arvlCd) || other.arvlCd == arvlCd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subwayId,
      updnLine,
      trainLineNm,
      statnFid,
      statnTid,
      statnId,
      statnNm,
      subwayList,
      btrainSttus,
      btrainNo,
      bstatnNm,
      arvlMsg2,
      arvlCd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArrivalModelCopyWith<_$_ArrivalModel> get copyWith =>
      __$$_ArrivalModelCopyWithImpl<_$_ArrivalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArrivalModelToJson(
      this,
    );
  }
}

abstract class _ArrivalModel implements ArrivalModel {
  const factory _ArrivalModel(
      {final String subwayId,
      final String updnLine,
      final String trainLineNm,
      final String statnFid,
      final String statnTid,
      final String statnId,
      final String statnNm,
      final String subwayList,
      final String btrainSttus,
      final String btrainNo,
      final String bstatnNm,
      final String arvlMsg2,
      final String arvlCd}) = _$_ArrivalModel;

  factory _ArrivalModel.fromJson(Map<String, dynamic> json) =
      _$_ArrivalModel.fromJson;

  @override
  String get subwayId;
  @override

  /// 호선번호 1001,1002 ~~
  String get updnLine;
  @override

  /// 상행,하행,내선,외선
  String get trainLineNm;
  @override

  /// "방화행 - 마장방면",
  String get statnFid;
  @override

  /// 이전지하철역ID - 1004 00 0427 - 4호선 회현 0427
  String get statnTid;
  @override

  /// 다음지하철역ID - 1004 00 0425
  String get statnId;
  @override

  /// 지하철역ID - 1004 00 0426
  String get statnNm;
  @override

  /// 지하철역명
  String get subwayList;
  @override

  /// 지하철역 호선 리스트 "1001,1004,1063,1065",
  String get btrainSttus;
  @override

  /// ITX(T), 급행(EXP(S)), 일반(NOR(S))
  String get btrainNo;
  @override

  /// 열차번호
  String get bstatnNm;
  @override

  /// 종착
  String get arvlMsg2;
  @override

  /// 도착메시지
  String get arvlCd;
  @override
  @JsonKey(ignore: true)
  _$$_ArrivalModelCopyWith<_$_ArrivalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
