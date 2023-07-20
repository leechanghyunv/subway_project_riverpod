// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DistModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DistModel _$DistModelFromJson(Map<String, dynamic> json) {
  return _DistModel.fromJson(json);
}

/// @nodoc
mixin _$DistModel {
  String get latA => throw _privateConstructorUsedError;
  String get lngA => throw _privateConstructorUsedError;
  String get nameA => throw _privateConstructorUsedError;
  String get latB => throw _privateConstructorUsedError;
  String get lngB => throw _privateConstructorUsedError;
  String get nameB => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistModelCopyWith<DistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistModelCopyWith<$Res> {
  factory $DistModelCopyWith(DistModel value, $Res Function(DistModel) then) =
      _$DistModelCopyWithImpl<$Res, DistModel>;
  @useResult
  $Res call(
      {String latA,
      String lngA,
      String nameA,
      String latB,
      String lngB,
      String nameB});
}

/// @nodoc
class _$DistModelCopyWithImpl<$Res, $Val extends DistModel>
    implements $DistModelCopyWith<$Res> {
  _$DistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latA = null,
    Object? lngA = null,
    Object? nameA = null,
    Object? latB = null,
    Object? lngB = null,
    Object? nameB = null,
  }) {
    return _then(_value.copyWith(
      latA: null == latA
          ? _value.latA
          : latA // ignore: cast_nullable_to_non_nullable
              as String,
      lngA: null == lngA
          ? _value.lngA
          : lngA // ignore: cast_nullable_to_non_nullable
              as String,
      nameA: null == nameA
          ? _value.nameA
          : nameA // ignore: cast_nullable_to_non_nullable
              as String,
      latB: null == latB
          ? _value.latB
          : latB // ignore: cast_nullable_to_non_nullable
              as String,
      lngB: null == lngB
          ? _value.lngB
          : lngB // ignore: cast_nullable_to_non_nullable
              as String,
      nameB: null == nameB
          ? _value.nameB
          : nameB // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DistModelCopyWith<$Res> implements $DistModelCopyWith<$Res> {
  factory _$$_DistModelCopyWith(
          _$_DistModel value, $Res Function(_$_DistModel) then) =
      __$$_DistModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String latA,
      String lngA,
      String nameA,
      String latB,
      String lngB,
      String nameB});
}

/// @nodoc
class __$$_DistModelCopyWithImpl<$Res>
    extends _$DistModelCopyWithImpl<$Res, _$_DistModel>
    implements _$$_DistModelCopyWith<$Res> {
  __$$_DistModelCopyWithImpl(
      _$_DistModel _value, $Res Function(_$_DistModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latA = null,
    Object? lngA = null,
    Object? nameA = null,
    Object? latB = null,
    Object? lngB = null,
    Object? nameB = null,
  }) {
    return _then(_$_DistModel(
      latA: null == latA
          ? _value.latA
          : latA // ignore: cast_nullable_to_non_nullable
              as String,
      lngA: null == lngA
          ? _value.lngA
          : lngA // ignore: cast_nullable_to_non_nullable
              as String,
      nameA: null == nameA
          ? _value.nameA
          : nameA // ignore: cast_nullable_to_non_nullable
              as String,
      latB: null == latB
          ? _value.latB
          : latB // ignore: cast_nullable_to_non_nullable
              as String,
      lngB: null == lngB
          ? _value.lngB
          : lngB // ignore: cast_nullable_to_non_nullable
              as String,
      nameB: null == nameB
          ? _value.nameB
          : nameB // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DistModel implements _DistModel {
  const _$_DistModel(
      {this.latA = "정보없음",
      this.lngA = "정보없음",
      this.nameA = "정보없음",
      this.latB = "정보없음",
      this.lngB = "정보없음",
      this.nameB = "정보없음"});

  factory _$_DistModel.fromJson(Map<String, dynamic> json) =>
      _$$_DistModelFromJson(json);

  @override
  @JsonKey()
  final String latA;
  @override
  @JsonKey()
  final String lngA;
  @override
  @JsonKey()
  final String nameA;
  @override
  @JsonKey()
  final String latB;
  @override
  @JsonKey()
  final String lngB;
  @override
  @JsonKey()
  final String nameB;

  @override
  String toString() {
    return 'DistModel(latA: $latA, lngA: $lngA, nameA: $nameA, latB: $latB, lngB: $lngB, nameB: $nameB)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DistModel &&
            (identical(other.latA, latA) || other.latA == latA) &&
            (identical(other.lngA, lngA) || other.lngA == lngA) &&
            (identical(other.nameA, nameA) || other.nameA == nameA) &&
            (identical(other.latB, latB) || other.latB == latB) &&
            (identical(other.lngB, lngB) || other.lngB == lngB) &&
            (identical(other.nameB, nameB) || other.nameB == nameB));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latA, lngA, nameA, latB, lngB, nameB);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistModelCopyWith<_$_DistModel> get copyWith =>
      __$$_DistModelCopyWithImpl<_$_DistModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistModelToJson(
      this,
    );
  }
}

abstract class _DistModel implements DistModel {
  const factory _DistModel(
      {final String latA,
      final String lngA,
      final String nameA,
      final String latB,
      final String lngB,
      final String nameB}) = _$_DistModel;

  factory _DistModel.fromJson(Map<String, dynamic> json) =
      _$_DistModel.fromJson;

  @override
  String get latA;
  @override
  String get lngA;
  @override
  String get nameA;
  @override
  String get latB;
  @override
  String get lngB;
  @override
  String get nameB;
  @override
  @JsonKey(ignore: true)
  _$$_DistModelCopyWith<_$_DistModel> get copyWith =>
      throw _privateConstructorUsedError;
}
