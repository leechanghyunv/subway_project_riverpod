import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../custom/TextFrame_Error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/ArrivalModel.dart';
import '../custom/TextFrame.dart';
import '../model/DataModel.dart';

class LinePickerB extends ConsumerWidget {
   LinePickerB({super.key});

  late String lineNumber;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    var filtered = ref.watch(infoProvider);
    final arrivel = ref.watch(arrivalProvider);
    return AlertDialog(
      content: StatefulBuilder(builder: (__, StateSetter setState){
        return Container(
          height: filtered.length == 1 ? 270
              : filtered.length == 2 ? 320
              : filtered.length == 3 ? 370
              : filtered.length == 4 ? 420
              : filtered.length == 5 ? 470
              : 520,
          alignment: Alignment.center,
          width: double.maxFinite,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFrame(comment: '${filtered[0].subname}'),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(filtered.length,
                          (index) => CheckboxListTile(
                              value: filtered[index].isSelected,
                              activeColor: Colors.grey[600],
                              title: Row(
                                children: [
                                  IconCustom(filtered[index].line_ui),
                                  SizedBox(width: 10,),
                                  TextFrame(comment: filtered[index].line_ui),
                                ],
                              ),
                              subtitle: arrivel.when(
                                loading: () => TextFrame(comment: 'loading.....'),
                                error: (err, stack) => Text(err.toString()),
                                data: (data){
                                  try{
                                    var lineList = filtered[index].subwayid.toString();
                                    var arrival = data.where((e) => e.subwayId == lineList).toList();
                                    var updnLine1 = ['상행', '내선'],
                                        updnLine2 = ['하행', '외선'];
                                    var updn1First = arrival
                                        .where((element) =>
                                        updnLine1.contains(element.updnLine))
                                        .map((e) => '${e.trainLineNm}')
                                        .first;
                                    var updn2First = arrival
                                        .where((element) =>
                                        updnLine2.contains(element.updnLine))
                                        .map((e) => '${e.trainLineNm}')
                                        .first;
                                    return Text(lineList.isNotEmpty
                                        ? '${updn1First.split(
                                        "-")[1]}  -  ${updn2First.split("-")[1]}'
                                        : '',
                                      style: TextStyle(
                                        fontSize: appHeight * 0.0115,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    );
                                  }catch(e){
                                    return TextFrame_Error(comment: '실시간 데이터를 가져올 수 없습니다');
                                  }
                                },
                              ),
                              onChanged: (value){
                                if(value != null){
                                  filtered = List.from(filtered.map((e) {
                                    if(e.line_ui == filtered[index].line_ui){
                                      lineNumber = filtered[index].line_ui;
                                      ref.read(infoProvider.notifier).searchSubway(
                                          name: filtered[0].subname, line: lineNumber);
                                      ref.read(storeProviderA.notifier).storeSubData('T');
                                      Navigator.pop(context);
                                      return e.copyWith(isSelected: true);
                                    } else {
                                      return e;
                                    }
                                  })
                                  );
                                }
                                setState(() {});
                              }),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      actions: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.
                    all(Colors.grey[300]),
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('Done',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget IconCustom(String line) =>
      Icon(Icons.square,
        color: line == 'Line1' ? const Color(0xff2a4193)
            : line == 'Line2' ? const Color(0xff027a31)
            : line == 'Line3' ? const Color(0xffd75e02)
            : line == 'Line4' ? const Color(0xff028bb9)
            : line == 'Line5' ? const Color(0xff9637b6)
            : line == 'Line6' ? const Color(0xff885408)
            : line == 'Line7' ? const Color(0xff525d02)
            : line == 'Line8' ? const Color(0xfff62d37)
            : line == 'Line9' ? const Color(0xff916a2a)
            : line == '서해' ? const Color(0xff8FC31F)
            : line == '공항철도' ? const Color(0xff0090D2)
            : line == '경의선' ? const Color(0xff77C4A3)
            : line == '경춘선' ? const Color(0xff0C8E72)
            : line == '수인분당' ? const Color(0xFFE8E818)
            : line == '신분당' ? const Color(0xffD4003B)
           : line == '경강선' ? const Color(0xff003DA5)
           : line == '인천1선' ? const Color(0xff7CA8D5)
           : line == '인천2선' ? const Color(0xffED8B00)
           : line == '에버라인' ? const Color(0xff6FB245)
           : line == '의정부' ? const Color(0xffFDA600)
            : line == '우이신설' ? const Color(0xffB7C452)
            : line == '김포골드' ? const Color(0xffA17800)
        // : line == '신림' ? const Color(0xff6789CA)
            : Colors.black,
      );
}
