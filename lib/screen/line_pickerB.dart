import 'package:subway_project_230704/setting/export.dart';

class LinePickerB extends ConsumerWidget {
   LinePickerB({super.key});

  late String lineNumber;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appWidth = MediaQuery.of(context).size.width;
    var filtered = ref.watch(infoProvider);
    return AlertDialog(
      content: StatefulBuilder(
          builder: (__, StateSetter setState){
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
                child: DialogDesign(
                    designText: '${filtered[0].subname}역'),
              ),
              Container(
                color: Colors.grey[200],
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
                              subtitle: Consumer(
                                builder: (context,ref,child){
                                  var lineList = filtered[index].subwayid.toString();
                                  final filted = ref.watch(filtedInPickerProvider(lineList));
                                  return filted.when(
                                    loading: () => TextFrame(comment: 'loading.....'),
                                    error: (err, stack) => TextFrame(comment: '데이터를 불러올 수 없습니다'),
                                    data: (data){
                                      return Text(lineList.isNotEmpty
                                          ? '${filted.value!.upfirst!.split(
                                          "-")[1]}  -  ${filted.value!.downfirst!.split("-")[1]}'
                                          : '',
                                        style: TextStyle(
                                          fontSize: appWidth * 0.0242,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              onChanged: (value){
                                if(value != null){
                                  filtered = List.from(filtered.map((e) {
                                    if(e.line_ui == filtered[index].line_ui){
                                      lineNumber = filtered[index].line_ui;
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
                    ref.read(infoProviderB.notifier).searchSubway(
                        name: filtered[0].subname, line: lineNumber);
                    ref.read(storeProviderA.notifier).storeSubData('T');
                    savemsg2(filtered[0].subname);
                    Navigator.of(context).pop();
                  },
                  child: Text('Done',
                    style: TextStyle(
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
   color: switch(line){
     'Line1' => Color(0xff2a4193), 'Line2' => Color(0xff027a31),
     'Line3' => Color(0xffd75e02), 'Line4' => Color(0xff028bb9),
     'Line5' => Color(0xff9637b6), 'Line6' => Color(0xff885408),
     'Line7' => Color(0xff525d02), 'Line8' => Color(0xfff62d37),
     'Line9' => Color(0xff916a2a), '서해' => Color(0xff8FC31F),
     '공항철도' => Color(0xff0090D2), '경의선' => Color(0xff77C4A3),
     '경춘선' => Color(0xff0C8E72), '수인분당' => Color(0xFFE7E727),
     '신분당' => Color(0xffD4003B), '경강선' => Color(0xff003DA5),
     '인천1선' => Color(0xff7CA8D5), '인천2선' => Color(0xffED8B00),
     '에버라인' => Color(0xff6FB245), '의정부' => Color(0xffFDA600),
     '우이신설' => Color(0xffB7C452), '김포골드' => Color(0xffA17800),
     '신림' => Color(0xff6789CA),
     _ => Colors.black,
   },
      );
}
