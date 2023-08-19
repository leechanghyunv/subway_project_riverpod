import 'package:subway_project_230704/setting/export.dart';
part 'distance_model.freezed.dart';
part 'distance_model.g.dart';

@Freezed()
class DistModel with _$DistModel{
  const factory DistModel({
    @Default("정보없음") String latA,
    @Default("정보없음") String lngA,
    @Default("정보없음") String nameA,
    @Default("정보없음") String latB,
    @Default("정보없음") String lngB,
    @Default("정보없음") String nameB,
  }) = _DistModel;
  factory DistModel.fromJson(Map<String, Object?> json) => _$DistModelFromJson(json);
}

