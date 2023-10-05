// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choice_chip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChipModel _$ChipModelFromJson(Map<String, dynamic> json) {
  return _ChipModel.fromJson(json);
}

/// @nodoc
mixin _$ChipModel {
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChipModelCopyWith<ChipModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChipModelCopyWith<$Res> {
  factory $ChipModelCopyWith(ChipModel value, $Res Function(ChipModel) then) =
      _$ChipModelCopyWithImpl<$Res, ChipModel>;
  @useResult
  $Res call({@HiveField(1) String name});
}

/// @nodoc
class _$ChipModelCopyWithImpl<$Res, $Val extends ChipModel>
    implements $ChipModelCopyWith<$Res> {
  _$ChipModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChipModelCopyWith<$Res> implements $ChipModelCopyWith<$Res> {
  factory _$$_ChipModelCopyWith(
          _$_ChipModel value, $Res Function(_$_ChipModel) then) =
      __$$_ChipModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(1) String name});
}

/// @nodoc
class __$$_ChipModelCopyWithImpl<$Res>
    extends _$ChipModelCopyWithImpl<$Res, _$_ChipModel>
    implements _$$_ChipModelCopyWith<$Res> {
  __$$_ChipModelCopyWithImpl(
      _$_ChipModel _value, $Res Function(_$_ChipModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_ChipModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1)
class _$_ChipModel implements _ChipModel {
  const _$_ChipModel({@HiveField(1) this.name = '정보없음'});

  factory _$_ChipModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChipModelFromJson(json);

  @override
  @JsonKey()
  @HiveField(1)
  final String name;

  @override
  String toString() {
    return 'ChipModel(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChipModel &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChipModelCopyWith<_$_ChipModel> get copyWith =>
      __$$_ChipModelCopyWithImpl<_$_ChipModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChipModelToJson(
      this,
    );
  }
}

abstract class _ChipModel implements ChipModel {
  const factory _ChipModel({@HiveField(1) final String name}) = _$_ChipModel;

  factory _ChipModel.fromJson(Map<String, dynamic> json) =
      _$_ChipModel.fromJson;

  @override
  @HiveField(1)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ChipModelCopyWith<_$_ChipModel> get copyWith =>
      throw _privateConstructorUsedError;
}
