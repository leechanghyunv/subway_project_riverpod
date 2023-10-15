// Project imports:
import '../../../custom_widget/icon_custom.dart';
import '../../../setting/export.dart';
import '../../../setting/export+.dart';

class LinePickerB extends ConsumerWidget {
   LinePickerB({super.key});

  late String lineNumber;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
                                PickerIcon(filtered[index].line_ui),
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
                                      return TextFrame_min(
                                          comment: lineList.isNotEmpty
                                          ? '${filted.value!.upfirst!.split(
                                          "-")[1]}  -  ${filted.value!.downfirst!.split("-")[1]}'
                                          : '');
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
                  child: Text(
                    'Done', style: commonmin,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


}
