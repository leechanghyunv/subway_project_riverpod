import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subway_project_230704/custom/text_frame.dart';
import 'package:subway_project_230704/setting/export.dart';
import '../model/arrival_model.dart';
import '../model/weather_model.dart';
import '../parts/qr_container.dart';
import 'transfer_button.dart';

class SwitchDialogA extends ConsumerWidget {
  final String name;
  final String list;
  final String dest;
  final String line;

  const SwitchDialogA(this.name, this.list, this.dest, this.line, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    final arrivel = ref.watch(arrivalProvider);
    final weather = ref.watch(weatherProvider);
    final temp = ref.watch(tempProvider);
    final svg = ref.watch(svgProvider);

    return Container(
      height: appHeight * 0.42,
      /// appHeight * 0.4,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DialogDesign(
            designText: 'RealTime Arrival',
          ),
          Tooltip(
            message: ref.watch(routeProvider),
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white),
            child: Container(
                color: Colors.grey[100],
                width: double.maxFinite,
                child: arrivel.when(
                  loading: () => TextFrame(comment: 'loading.....'),
                  error: (err, stack) => Text(err.toString()),
                  data: (data) {
                    try {
                      var filtedArrival = data
                          .where((element) => element.subwayId == list).toList();
                      var updnLine1 = ['상행', '내선'], updnLine2 = ['하행', '외선'];
                      var updn1First = filtedArrival
                          .where(
                              (element) => updnLine1.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first;
                      var updn1Last = filtedArrival
                          .where(
                              (element) => updnLine1.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last;
                      var updn2First = filtedArrival
                          .where(
                              (element) => updnLine2.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first;
                      var updn2Last = filtedArrival
                          .where(
                              (element) => updnLine2.contains(element.updnLine))
                          .map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFrame(
                            comment: '\n${line} ${name}역 -> ${dest}역\n',
                          ),
                          TextFrame(comment: updn1First.toString()),
                          TextFrame(comment: updn1Last.toString()),
                          TextFrame(comment: updn2First.toString()),
                          TextFrame(comment: updn2Last.toString()),
                        ],
                      );
                    } catch (e) {
                      return Container(
                          child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFrame(comment: '${name}역 실시간 데이터를 가져올 수 없습니다.'),
                      ));
                    }
                  },
                )),
          ),
          Container(
            width: double.maxFinite,
            color: Colors.white,
            child: Row(
                children: [
                  svg.when(
                    loading: () => const Center(
                        child: TextFrame(comment: 'loading.....')),
                    error: (err, stack) => Text(err.toString()),
                    data: (data){
                      return data;
                    },
                  ),
                  weather.when(
                    loading: () => const Center(
                        child: TextFrame(comment: 'loading.....')),
                    error: (err, stack) => Text(err.toString()),
                    data: (data){
                      return Container(
                          color: Colors.white,
                          child: Text(data.first.description,
                            style: TextStyle(
                              fontSize: appHeight * 0.0164,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                    },
                  ),
                  Expanded(child: Text('')),
                  TransferIcon(),

                ],
              ),
          ),

        ],
      ),
    );
  }
}
