import 'package:subway_project_230704/setting/export.dart';

List<Color> kDefaultRainbowColors2 = [
  Colors.grey.shade600,
  Colors.grey.shade600,
  Colors.grey.shade600,
];

final latlonglineProvier = StateProvider<String>((ref) => ref.watch(lineProvier));

class SwitchDialogB extends ConsumerWidget {

  final List<dynamic> subwayList;

  SwitchDialogB(this.subwayList, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;
    ref.listen(lineProvier, (previous, next) {
      ref.read(latlonglineProvier.notifier).update((state) =>
      state = ref.watch(dustProvider).elementAtOrNull(0)!.barLevel.toString());
    });

    return Container(
      color: Colors.white,
      height: appRatio >= 0.5 ? appWidth * 0.9662 : appWidth * 1.1,
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
            height: appRatio >= 0.5 ? appWidth * 0.51 : appWidth * 0.6268,
            child: DialogPage(),
          ),
          Container(
            height: appWidth * 0.0845,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.grey[100],
                    height: appWidth * 0.0845,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  width: appWidth * 0.1812,
                  height: appWidth * 0.0845,
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
                              value,
                              style: TextStyle(
                                  fontSize: appWidth * 0.0362,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),)
                        );
                      }).toList(),
                      onChanged: (val){
                        print(val);
                        ref.read(latlonglineProvier.notifier).
                        update((state) => state = val);
                      }),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: appWidth * 0.09,
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
                                comment: '$row'),
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,color: Colors.black),
                            selected: true,
                            onSelected: (isSelected) {
                              ref.read(infoProvider.notifier).searchSubway(name: row);
                              Get.dialog(
                                LinePickerA(),
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
    'Line1', 'Line2', 'Line3', 'Line4', 'Line5', 'Line6', 'Line7', 'Line8', 'Line9', '신분당', '수인분당', '경의선', '우이신설', '신림', '공항철도',
  ];
}

