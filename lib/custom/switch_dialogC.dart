import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subway_project_230704/model/data_model.dart';
import '../model/arrival_model.dart';
import '../model/weather_model.dart';
import '../parts/qr_container.dart';
import '../screen/layout_screen.dart';
import '../setting/initival_value.dart';
import 'text_frame.dart';

class SwitchDialogC extends ConsumerStatefulWidget {

   SwitchDialogC({super.key});

  @override
  ConsumerState<SwitchDialogC> createState() => _SwitchDialogCState();
}

class _SwitchDialogCState extends ConsumerState<SwitchDialogC> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    final arrivel = ref.watch(arrivalProvider);
    final weather = ref.watch(weatherProvider);
    final subdata = ref.watch(infoProvider);
    final temp = ref.watch(tempProvider);
    final svg = ref.watch(svgProvider);
    return Container(
      height: appHeight * 0.42,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DialogDesign(
            designText: 'RealTime Arrival',
          ),
          Container(
            color: Colors.grey[100],
            width: double.maxFinite,
            child: arrivel.when(
              loading: () => TextFrame(comment: 'loading.....'),
              error: (err, stack) => Text(err.toString()),
              data: (data) {
                try {
                  var filtedArrival = data
                      .where((element) => element.subwayId == subdata.first.subwayid.toString()).toList();
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
                        comment: '\n${subdata.first.line} ${subdata.first.subname}역\n',
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
                        child: TextFrame(comment: '${subdata.first.subname}역 실시간 데이터를 가져올 수 없습니다.'),
                      ));
                }
              },
            ),
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
                SizedBox(width: 5,),
                weather.when(
                  loading: () => const Center(
                      child: TextFrame(comment: 'loading.....')),
                  error: (err, stack) => Text(err.toString()),
                  data: (data){
                    return Container(
                        color: Colors.white,
                        child: Text(data.first.description,
                          style: TextStyle(
                            fontSize: appHeight * 0.0163,
                            fontWeight: FontWeight.bold,

                          ),
                        ),


                    );
                  },
                ),
                const Expanded(child: Text('')),
                PopupMenuButton(
                  itemBuilder: (BuildContext context){
                    return ref.watch(infoProviderB).map((e){
                      return PopupMenuItem(
                          value: e.line_ui,
                          child: TextFrame(comment: e.line_ui)
                      );
                    }).toList();
                  },
                  child: Icon(Icons.menu),
                  onSelected: (value){
                    print(value);
                    ref.read(infoProvider.notifier).searchSubway(name: subdata.first.subname,line: value); // line: value
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}




