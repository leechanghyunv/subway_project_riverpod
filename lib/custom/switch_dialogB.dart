import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../model/data_model.dart';
import '../model/microdust_model.dart';
import '../screen/dialog_screen.dart';
import '../screen/line_pickerA.dart';
import '../setting/initival_value.dart';
import '../parts/qr_container.dart';
import 'text_frame.dart';

List<Color> kDefaultRainbowColors2 = [
  Colors.grey.shade600,
  Colors.grey.shade600,
  Colors.grey.shade600,
];

final latlonglineProvier = StateProvider<String>((ref) => 'Line2');

class SwitchDialogB extends ConsumerWidget {

  final List<dynamic> subwayList;

  SwitchDialogB(this.subwayList, {super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    double mainBoxHeight = appHeight * 0.58;
    ref.listen(lineProvier, (previous, next) {
      ref.read(latlonglineProvier.notifier).update((state) =>
      state = ref.watch(dustProvider).elementAtOrNull(0)!.barLevel.toString());
    });

    return Container(
      color: Colors.white,
      height: appHeight * 0.51,
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
            height: appHeight * 0.2907,
            child: DialogPage(),
          ),
          Container(
            height: appHeight * 0.03907,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.grey[100],
                    height: appHeight * 0.03907,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.grey[300],
                  width: 75,
                  height: appHeight * 0.03907,
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
                                  fontSize: mainBoxHeight / 37,
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
              height: 35,
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


