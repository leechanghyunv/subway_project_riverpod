// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UserModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFields _$UserFieldsFromJson(Map<String, dynamic> json) {
  return _UserFields.fromJson(json);
}

/// @nodoc
mixin _$UserFields {
  int get id => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  String get goodthing => throw _privateConstructorUsedError;
  String get unconfortable => throw _privateConstructorUsedError;
  String get comment1 => throw _privateConstructorUsedError;
  String? get currentTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFieldsCopyWith<UserFields> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFieldsCopyWith<$Res> {
  factory $UserFieldsCopyWith(
          UserFields value, $Res Function(UserFields) then) =
      _$UserFieldsCopyWithImpl<$Res, UserFields>;
  @useResult
  $Res call(
      {int id,
      String gender,
      String age,
      String frequency,
      String goodthing,
      String unconfortable,
      String comment1,
      String? currentTime});
}

/// @nodoc
class _$UserFieldsCopyWithImpl<$Res, $Val extends UserFields>
    implements $UserFieldsCopyWith<$Res> {
  _$UserFieldsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gender = null,
    Object? age = null,
    Object? frequency = null,
    Object? goodthing = null,
    Object? unconfortable = null,
    Object? comment1 = null,
    Object? currentTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      goodthing: null == goodthing
          ? _value.goodthing
          : goodthing // ignore: cast_nullable_to_non_nullable
              as String,
      unconfortable: null == unconfortable
          ? _value.unconfortable
          : unconfortable // ignore: cast_nullable_to_non_nullable
              as String,
      comment1: null == comment1
          ? _value.comment1
          : comment1 // ignore: cast_nullable_to_non_nullable
              as String,
      currentTime: freezed == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserFieldsCopyWith<$Res>
    implements $UserFieldsCopyWith<$Res> {
  factory _$$_UserFieldsCopyWith(
          _$_UserFields value, $Res Function(_$_UserFields) then) =
      __$$_UserFieldsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String gender,
      String age,
      String frequency,
      String goodthing,
      String unconfortable,
      String comment1,
      String? currentTime});
}

/// @nodoc
class __$$_UserFieldsCopyWithImpl<$Res>
    extends _$UserFieldsCopyWithImpl<$Res, _$_UserFields>
    implements _$$_UserFieldsCopyWith<$Res> {
  __$$_UserFieldsCopyWithImpl(
      _$_UserFields _value, $Res Function(_$_UserFields) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gender = null,
    Object? age = null,
    Object? frequency = null,
    Object? goodthing = null,
    Object? unconfortable = null,
    Object? comment1 = null,
    Object? currentTime = freezed,
  }) {
    return _then(_$_UserFields(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      goodthing: null == goodthing
          ? _value.goodthing
          : goodthing // ignore: cast_nullable_to_non_nullable
              as String,
      unconfortable: null == unconfortable
          ? _value.unconfortable
          : unconfortable // ignore: cast_nullable_to_non_nullable
              as String,
      comment1: null == comment1
          ? _value.comment1
          : comment1 // ignore: cast_nullable_to_non_nullable
              as String,
      currentTime: freezed == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserFields implements _UserFields {
  const _$_UserFields(
      {required this.id,
      required this.gender,
      required this.age,
      required this.frequency,
      required this.goodthing,
      required this.unconfortable,
      required this.comment1,
      required this.currentTime});

  factory _$_UserFields.fromJson(Map<String, dynamic> json) =>
      _$$_UserFieldsFromJson(json);

  @override
  final int id;
  @override
  final String gender;
  @override
  final String age;
  @override
  final String frequency;
  @override
  final String goodthing;
  @override
  final String unconfortable;
  @override
  final String comment1;
  @override
  final String? currentTime;

  @override
  String toString() {
    return 'UserFields(id: $id, gender: $gender, age: $age, frequency: $frequency, goodthing: $goodthing, unconfortable: $unconfortable, comment1: $comment1, currentTime: $currentTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFields &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.goodthing, goodthing) ||
                other.goodthing == goodthing) &&
            (identical(other.unconfortable, unconfortable) ||
                other.unconfortable == unconfortable) &&
            (identical(other.comment1, comment1) ||
                other.comment1 == comment1) &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, gender, age, frequency,
      goodthing, unconfortable, comment1, currentTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserFieldsCopyWith<_$_UserFields> get copyWith =>
      __$$_UserFieldsCopyWithImpl<_$_UserFields>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFieldsToJson(
      this,
    );
  }
}

abstract class _UserFields implements UserFields {
  const factory _UserFields(
      {required final int id,
      required final String gender,
      required final String age,
      required final String frequency,
      required final String goodthing,
      required final String unconfortable,
      required final String comment1,
      required final String? currentTime}) = _$_UserFields;

  factory _UserFields.fromJson(Map<String, dynamic> json) =
      _$_UserFields.fromJson;

  @override
  int get id;
  @override
  String get gender;
  @override
  String get age;
  @override
  String get frequency;
  @override
  String get goodthing;
  @override
  String get unconfortable;
  @override
  String get comment1;
  @override
  String? get currentTime;
  @override
  @JsonKey(ignore: true)
  _$$_UserFieldsCopyWith<_$_UserFields> get copyWith =>
      throw _privateConstructorUsedError;
}
