import 'package:freezed_annotation/freezed_annotation.dart';
part 'UserModel.freezed.dart';
part 'UserModel.g.dart';

@Freezed()
class UserFields with _$UserFields{
  const factory UserFields({
    required int id,
    required String gender,
    required String age,
    required String frequency,
    required String goodthing,
    required String unconfortable,
    required String comment1,
    required String? currentTime,
  }) = _UserFields;
  factory UserFields.fromJson(Map<String, Object?> json) => _$UserFieldsFromJson(json);
}