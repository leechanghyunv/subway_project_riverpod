// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TableProviderModel _$TableProviderModelFromJson(Map<String, dynamic> json) {
  return _TableProviderModel.fromJson(json);
}

/// @nodoc
mixin _$TableProviderModel {
  List<TableModel> get tableA => throw _privateConstructorUsedError;
  List<TableModel> get tableB => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableProviderModelCopyWith<TableProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableProviderModelCopyWith<$Res> {
  factory $TableProviderModelCopyWith(
          TableProviderModel value, $Res Function(TableProviderModel) then) =
      _$TableProviderModelCopyWithImpl<$Res, TableProviderModel>;
  @useResult
  $Res call({List<TableModel> tableA, List<TableModel> tableB});
}

/// @nodoc
class _$TableProviderModelCopyWithImpl<$Res, $Val extends TableProviderModel>
    implements $TableProviderModelCopyWith<$Res> {
  _$TableProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableA = null,
    Object? tableB = null,
  }) {
    return _then(_value.copyWith(
      tableA: null == tableA
          ? _value.tableA
          : tableA // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
      tableB: null == tableB
          ? _value.tableB
          : tableB // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TableProviderModelCopyWith<$Res>
    implements $TableProviderModelCopyWith<$Res> {
  factory _$$_TableProviderModelCopyWith(_$_TableProviderModel value,
          $Res Function(_$_TableProviderModel) then) =
      __$$_TableProviderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TableModel> tableA, List<TableModel> tableB});
}

/// @nodoc
class __$$_TableProviderModelCopyWithImpl<$Res>
    extends _$TableProviderModelCopyWithImpl<$Res, _$_TableProviderModel>
    implements _$$_TableProviderModelCopyWith<$Res> {
  __$$_TableProviderModelCopyWithImpl(
      _$_TableProviderModel _value, $Res Function(_$_TableProviderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableA = null,
    Object? tableB = null,
  }) {
    return _then(_$_TableProviderModel(
      tableA: null == tableA
          ? _value._tableA
          : tableA // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
      tableB: null == tableB
          ? _value._tableB
          : tableB // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TableProviderModel
    with DiagnosticableTreeMixin
    implements _TableProviderModel {
  const _$_TableProviderModel(
      {required final List<TableModel> tableA,
      required final List<TableModel> tableB})
      : _tableA = tableA,
        _tableB = tableB;

  factory _$_TableProviderModel.fromJson(Map<String, dynamic> json) =>
      _$$_TableProviderModelFromJson(json);

  final List<TableModel> _tableA;
  @override
  List<TableModel> get tableA {
    if (_tableA is EqualUnmodifiableListView) return _tableA;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tableA);
  }

  final List<TableModel> _tableB;
  @override
  List<TableModel> get tableB {
    if (_tableB is EqualUnmodifiableListView) return _tableB;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tableB);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TableProviderModel(tableA: $tableA, tableB: $tableB)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TableProviderModel'))
      ..add(DiagnosticsProperty('tableA', tableA))
      ..add(DiagnosticsProperty('tableB', tableB));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableProviderModel &&
            const DeepCollectionEquality().equals(other._tableA, _tableA) &&
            const DeepCollectionEquality().equals(other._tableB, _tableB));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tableA),
      const DeepCollectionEquality().hash(_tableB));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableProviderModelCopyWith<_$_TableProviderModel> get copyWith =>
      __$$_TableProviderModelCopyWithImpl<_$_TableProviderModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableProviderModelToJson(
      this,
    );
  }
}

abstract class _TableProviderModel implements TableProviderModel {
  const factory _TableProviderModel(
      {required final List<TableModel> tableA,
      required final List<TableModel> tableB}) = _$_TableProviderModel;

  factory _TableProviderModel.fromJson(Map<String, dynamic> json) =
      _$_TableProviderModel.fromJson;

  @override
  List<TableModel> get tableA;
  @override
  List<TableModel> get tableB;
  @override
  @JsonKey(ignore: true)
  _$$_TableProviderModelCopyWith<_$_TableProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
