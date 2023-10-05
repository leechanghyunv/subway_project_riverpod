import 'package:hive/hive.dart';
import '../model/choice_chip_model.dart';

Box<ChipModel>? chipbox;

class HiveService {

  Future openBox() async {
    chipbox = await Hive.openBox<ChipModel>('chipbox');
  }

  void putBox(ChipModel chipModel) {
    if(chipbox!.values.length <= 5){
      chipbox?.add(chipModel);
      print(chipbox?.values.map((e) => e.name).toSet().toList() ?? []);
    } else {
      print('5가 넘어감 ${chipbox!.values.length}');
      chipbox?.deleteAt(0);
    }
  }
}

