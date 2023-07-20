// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TableModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TableModel _$TableModelFromJson(Map<String, dynamic> json) {
  return _TableModel.fromJson(json);
}

/// @nodoc
mixin _$TableModel {
  @JsonKey(name: 'STATION_CD')
  String get stationcd => throw _privateConstructorUsedError;
  @JsonKey(name: 'STATION_NM')
  String get stationnm => throw _privateConstructorUsedError;
  @JsonKey(name: 'ARRIVETIME')
  String get arrivetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'ORIGINSTATION')
  String get originstation => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUBWAYSNAME')
  String get sname => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUBWAYENAME')
  String get ename => throw _privateConstructorUsedError;
  @JsonKey(name: 'EXPRESS_YN')
  EXPRESS get express => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableModelCopyWith<TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableModelCopyWith<$Res> {
  factory $TableModelCopyWith(
          TableModel value, $Res Function(TableModel) then) =
      _$TableModelCopyWithImpl<$Res, TableModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'STATION_CD') String stationcd,
      @JsonKey(name: 'STATION_NM') String stationnm,
      @JsonKey(name: 'ARRIVETIME') String arrivetime,
      @JsonKey(name: 'ORIGINSTATION') String originstation,
      @JsonKey(name: 'SUBWAYSNAME') String sname,
      @JsonKey(name: 'SUBWAYENAME') String ename,
      @JsonKey(name: 'EXPRESS_YN') EXPRESS express});
}

/// @nodoc
class _$TableModelCopyWithImpl<$Res, $Val extends TableModel>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationcd = null,
    Object? stationnm = null,
    Object? arrivetime = null,
    Object? originstation = null,
    Object? sname = null,
    Object? ename = null,
    Object? express = null,
  }) {
    return _then(_value.copyWith(
      stationcd: null == stationcd
          ? _value.stationcd
          : stationcd // ignore: cast_nullable_to_non_nullable
              as String,
      stationnm: null == stationnm
          ? _value.stationnm
          : stationnm // ignore: cast_nullable_to_non_nullable
              as String,
      arrivetime: null == arrivetime
          ? _value.arrivetime
          : arrivetime // ignore: cast_nullable_to_non_nullable
              as String,
      originstation: null == originstation
          ? _value.originstation
          : originstation // ignore: cast_nullable_to_non_nullable
              as String,
      sname: null == sname
          ? _value.sname
          : sname // ignore: cast_nullable_to_non_nullable
              as String,
      ename: null == ename
          ? _value.ename
          : ename // ignore: cast_nullable_to_non_nullable
              as String,
      express: null == express
          ? _value.express
          : express // ignore: cast_nullable_to_non_nullable
              as EXPRESS,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TableModelCopyWith<$Res>
    implements $TableModelCopyWith<$Res> {
  factory _$$_TableModelCopyWith(
          _$_TableModel value, $Res Function(_$_TableModel) then) =
      __$$_TableModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'STATION_CD') String stationcd,
      @JsonKey(name: 'STATION_NM') String stationnm,
      @JsonKey(name: 'ARRIVETIME') String arrivetime,
      @JsonKey(name: 'ORIGINSTATION') String originstation,
      @JsonKey(name: 'SUBWAYSNAME') String sname,
      @JsonKey(name: 'SUBWAYENAME') String ename,
      @JsonKey(name: 'EXPRESS_YN') EXPRESS express});
}

/// @nodoc
class __$$_TableModelCopyWithImpl<$Res>
    extends _$TableModelCopyWithImpl<$Res, _$_TableModel>
    implements _$$_TableModelCopyWith<$Res> {
  __$$_TableModelCopyWithImpl(
      _$_TableModel _value, $Res Function(_$_TableModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationcd = null,
    Object? stationnm = null,
    Object? arrivetime = null,
    Object? originstation = null,
    Object? sname = null,
    Object? ename = null,
    Object? express = null,
  }) {
    return _then(_$_TableModel(
      stationcd: null == stationcd
          ? _value.stationcd
          : stationcd // ignore: cast_nullable_to_non_nullable
              as String,
      stationnm: null == stationnm
          ? _value.stationnm
          : stationnm // ignore: cast_nullable_to_non_nullable
              as String,
      arrivetime: null == arrivetime
          ? _value.arrivetime
          : arrivetime // ignore: cast_nullable_to_non_nullable
              as String,
      originstation: null == originstation
          ? _value.originstation
          : originstation // ignore: cast_nullable_to_non_nullable
              as String,
      sname: null == sname
          ? _value.sname
          : sname // ignore: cast_nullable_to_non_nullable
              as String,
      ename: null == ename
          ? _value.ename
          : ename // ignore: cast_nullable_to_non_nullable
              as String,
      express: null == express
          ? _value.express
          : express // ignore: cast_nullable_to_non_nullable
              as EXPRESS,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TableModel implements _TableModel {
  const _$_TableModel(
      {@JsonKey(name: 'STATION_CD') this.stationcd = "정보없음",
      @JsonKey(name: 'STATION_NM') this.stationnm = "정보없음",
      @JsonKey(name: 'ARRIVETIME') this.arrivetime = "정보없음",
      @JsonKey(name: 'ORIGINSTATION') this.originstation = "정보없음",
      @JsonKey(name: 'SUBWAYSNAME') this.sname = "정보없음",
      @JsonKey(name: 'SUBWAYENAME') this.ename = "정보없음",
      @JsonKey(name: 'EXPRESS_YN') this.express = EXPRESS.GENERAL});

  factory _$_TableModel.fromJson(Map<String, dynamic> json) =>
      _$$_TableModelFromJson(json);

  @override
  @JsonKey(name: 'STATION_CD')
  final String stationcd;
  @override
  @JsonKey(name: 'STATION_NM')
  final String stationnm;
  @override
  @JsonKey(name: 'ARRIVETIME')
  final String arrivetime;
  @override
  @JsonKey(name: 'ORIGINSTATION')
  final String originstation;
  @override
  @JsonKey(name: 'SUBWAYSNAME')
  final String sname;
  @override
  @JsonKey(name: 'SUBWAYENAME')
  final String ename;
  @override
  @JsonKey(name: 'EXPRESS_YN')
  final EXPRESS express;

  @override
  String toString() {
    return 'TableModel(stationcd: $stationcd, stationnm: $stationnm, arrivetime: $arrivetime, originstation: $originstation, sname: $sname, ename: $ename, express: $express)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableModel &&
            (identical(other.stationcd, stationcd) ||
                other.stationcd == stationcd) &&
            (identical(other.stationnm, stationnm) ||
                other.stationnm == stationnm) &&
            (identical(other.arrivetime, arrivetime) ||
                other.arrivetime == arrivetime) &&
            (identical(other.originstation, originstation) ||
                other.originstation == originstation) &&
            (identical(other.sname, sname) || other.sname == sname) &&
            (identical(other.ename, ename) || other.ename == ename) &&
            (identical(other.express, express) || other.express == express));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stationcd, stationnm, arrivetime,
      originstation, sname, ename, express);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableModelCopyWith<_$_TableModel> get copyWith =>
      __$$_TableModelCopyWithImpl<_$_TableModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableModelToJson(
      this,
    );
  }
}

abstract class _TableModel implements TableModel {
  const factory _TableModel(
      {@JsonKey(name: 'STATION_CD') final String stationcd,
      @JsonKey(name: 'STATION_NM') final String stationnm,
      @JsonKey(name: 'ARRIVETIME') final String arrivetime,
      @JsonKey(name: 'ORIGINSTATION') final String originstation,
      @JsonKey(name: 'SUBWAYSNAME') final String sname,
      @JsonKey(name: 'SUBWAYENAME') final String ename,
      @JsonKey(name: 'EXPRESS_YN') final EXPRESS express}) = _$_TableModel;

  factory _TableModel.fromJson(Map<String, dynamic> json) =
      _$_TableModel.fromJson;

  @override
  @JsonKey(name: 'STATION_CD')
  String get stationcd;
  @override
  @JsonKey(name: 'STATION_NM')
  String get stationnm;
  @override
  @JsonKey(name: 'ARRIVETIME')
  String get arrivetime;
  @override
  @JsonKey(name: 'ORIGINSTATION')
  String get originstation;
  @override
  @JsonKey(name: 'SUBWAYSNAME')
  String get sname;
  @override
  @JsonKey(name: 'SUBWAYENAME')
  String get ename;
  @override
  @JsonKey(name: 'EXPRESS_YN')
  EXPRESS get express;
  @override
  @JsonKey(ignore: true)
  _$$_TableModelCopyWith<_$_TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}
