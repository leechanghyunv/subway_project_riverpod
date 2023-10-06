// Project imports:
import 'package:subway_project_230704/setting/export.dart';

part 'schedule_provider_model.freezed.dart';
part 'schedule_provider_model.g.dart';

@freezed
class TableProviderModel with _$TableProviderModel {
  const factory TableProviderModel({
    required List<TableModel> tableA,
    required List<TableModel> tableB,
  }) = _TableProviderModel;

  factory TableProviderModel.fromJson(Map<String, dynamic> json) =>
      _$TableProviderModelFromJson(json);
}
