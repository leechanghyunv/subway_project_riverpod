// Package imports:
import 'package:hive/hive.dart';
import 'package:subway_project_230704/setting/export.dart';

// Project imports:
import '../../model/choice_chip_model.dart';

/// 검색후 출발지 혹은 도착지를 저장했던 지하철역의 이름들을 저장해주는 프로바이더 구간

Box<ChipModel>? chipbox;

class HiveService {

  Future openBox() async {
    chipbox = await Hive.openBox<ChipModel>('chipbox');
  }

  Future putBox(ChipModel chipModel) async {
    print('${chipModel.toString()}역 을 받았습니다');
    chipbox?.add(chipModel);
    print(chipbox?.values.map((e) => e.name).toSet().toList() ?? []);
    if(chipbox!.values.length <= 5){
      print('${chipbox!.values.length}');
    } else {
      print('5가 넘어감 ${chipbox!.values.length}');
      chipbox?.deleteAt(0);
    }
  }
}


