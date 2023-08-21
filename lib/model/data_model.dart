import 'package:subway_project_230704/setting/export.dart';
part 'data_model.freezed.dart';
part 'data_model.g.dart';

@Freezed()
class SubwayModel with _$SubwayModel{
  const factory SubwayModel({
    required String subname,
    required String engname,
    required double lat,
    required double lng,
    required String line_ui,
    required int subwayid,
    required String line,
    required String heading,
    @Default(false) bool? isSelected,
    @Default(0.0) num? km,

  }) = _SubwayModel;
  factory SubwayModel.fromJson(Map<String, Object?> json) => _$SubwayModelFromJson(json);
}
extension MutableSubwayModelExtension on SubwayModel {
  SubwayModel setKm(double newKm) {
    return copyWith(km: newKm);
  }
}
/// json file에서 데이터를 가져옴
final dataProviderInside = FutureProvider<List<SubwayModel>>((ref) async {
  final  jsonData = await rootBundle.loadString('assets/test.json');
  final List<dynamic> data = jsonDecode(jsonData)['subwaydata'];
  return data.map((e) => SubwayModel.fromJson(e)).toList();
});
/// subwayname, line을 사용자가 선택한 이후에 결과를 가지고 데이터 필터링

