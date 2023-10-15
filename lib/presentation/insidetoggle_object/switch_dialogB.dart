// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

List<Color> kDefaultRainbowColors2 = [
  Colors.grey.shade600,
  Colors.grey.shade600,
  Colors.grey.shade600,
];

final latlonglineProvier = StateProvider<String>((ref) => ref.watch(lineProvider));

class SwitchDialogB extends ConsumerWidget {

  SwitchDialogB(this.subwayList, {super.key});

  SharedPreManager sharedPreManager = SharedPreManager();
  HiveService hiveService = HiveService();

  final List<String> subwayList;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final initialdata = ref.watch(dataProviderInside);
    ref.listen(lineProvider, (previous, next) {
      sharedPreManager.init();
      ref.read(latlonglineProvier.notifier).update((state) =>
      state = ref.watch(dustProvider).elementAtOrNull(0)!.barLevel.toString());
    });
    return Container(
      color: Colors.white,
      height: Device.aspectRatio >= 0.5 ? 97.w : 110.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DialogDesign(designText: 'Location Tracking'),
              Expanded(child: Text('')),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey,
            height: Device.aspectRatio >= 0.5 ? 51.w : 63.w,
            child: DialogPage(),
          ),
          Container(
            height: 8.45.w,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.grey[100],
                    height: 8.45.w,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  width: 18.1.w,
                  height: 8.45.w,
                  child: DropdownButton(
                      value: ref.watch(latlonglineProvier),
                      dropdownColor: Colors.grey[200],
                      underline: Container(
                        alignment: Alignment.center,
                        color: Colors.grey[200],
                      ),
                      icon: SizedBox.shrink(),
                      items: menulist
                          .map<DropdownMenuItem<dynamic>>((dynamic value){
                        return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Text(
                              value, style: dropdown,
                            ),
                        );
                      }).toList(),
                      onChanged: (val){
                        ref.read(latlngProvider);
                        ref.read(locationProvider.notifier).getlocation();
                        ref.read(latlonglineProvier.notifier).update((state) => state = val);
                      }),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 9.w,
              color: Colors.white,
              alignment: Alignment.center,
              width: double.maxFinite,
              child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: subwayList.length,
                      itemBuilder: (context,index){
                        var row = subwayList[index];
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ChoiceChip(
                            label: TextFrame(
                                comment: row),
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,color: Colors.black),
                            selected: true,
                            onSelected: (isSelected) {
                              ref.read(infoProvider.notifier).searchSubway(name: row);
                              Get.dialog(
                                AlertDialog(
                                  content: initialdata.when(
                                    loading: () => LoadingBox('loading.....'),
                                    error: (err, stack) => LoadingBox(
                                        err.toString()),
                                    data: (data){
                                      ref.read(infoProvider.notifier).searchSubway(name: row);
                                      ref.read(infoProviderB.notifier).searchSubway(name: row);
                                      return SwitchDialogC();
                                    },
                                  ),
                                  actions: [
                                    DialogButton(
                                      comment: 'Cencel',
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    DialogButton(
                                      comment: 'Select',
                                      onPressed: (){
                                        Select(row);
                                        hiveService.putBox(ChipModel(name: row));
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                  ),

            ),
          ),
        ],
      ),
    );
  }

  List<String> menulist = [
    'Line1', 'Line2', 'Line3', 'Line4', 'Line5', 'Line6', 'Line7', 'Line8', 'Line9', '신분당', '수인분당', '경의선', '우이신설', '공항철도',
  ];

}


