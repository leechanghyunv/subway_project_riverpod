// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../model/arrival_model.dart';
import '../../model/trainstate_model.dart';
import '../../presentation/screen/screen_controller.dart';


/// 실시간 열차 정보를 제공해주는 프로바이더를 다시한번 필터링해주고 UI에 나타내는 프로바이더

class TrainStateController extends StateNotifier<TrainModel>{

  TrainStateController() : super(TrainModel());

  var updnLine1 = ['상행', '내선'], updnLine2 = ['하행', '외선'];

  void filtedTrainstate (List<ArrivalModel>? arrival) {
    if(arrival != null){
      var arrivalA = arrival.where((e) => updnLine1.contains(e.updnLine));
      var arrivalB = arrival.where((e) => updnLine2.contains(e.updnLine));
      
      var subNumber1 = arrivalA.map((e) => e.btrainNo).first;
      box.write('subNumber1', subNumber1);
      var subState1 = arrivalA.map((e) => e.arvlCd).first;
      box.write('subState1', subState1);
      var subSttus1 = arrivalA.map((e) => e.btrainSttus).first;
      box.write('state1', subSttus1);
      var destination1 = arrivalA.map((e) => e.trainLineNm).first;
      String filtedDestination1 = destination1.split(" - ")[0];
      box.write('destination1', filtedDestination1);
      var subNumber2 = arrivalB.map((e) => e.btrainNo).first;
      box.write('subNumber2', subNumber2);
      var subState2 = arrivalB.map((e) => e.arvlCd).first;
      box.write('subState2', subState2);
      var subSttus2 = arrivalB.map((e) => e.btrainSttus).first;
      box.write('state2', subSttus2);
      var destination2 = arrivalB.map((e) => e.trainLineNm).first;
      String filtedDestination2 = destination2.split(" - ")[0];
      box.write('destination2', filtedDestination2);
    } else {
    }
  }
}

final TrainStateProvider = StateNotifierProvider<TrainStateController,TrainModel>((ref) {
  return TrainStateController();
});
