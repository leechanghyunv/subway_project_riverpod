import 'package:subway_project_230704/custom/DialogButton.dart';
import 'package:subway_project_230704/setting/Export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../setting/UriController.dart';
import '../custom/SwitchDialogC.dart';
import '../parts/DesignDialogC.dart';
import '../parts/SmsContainer.dart';
import '../parts/QrContainer.dart';
import '../custom/TextFrame.dart';
import '../model/DataModel.dart';
import 'package:get/get.dart';
import 'MapScreen.dart';

class DialogPage extends ConsumerWidget {
   DialogPage({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    final latlongData = ref.watch(latlngProvider);
    final initialdata = ref.watch(dataProviderInside);

    return Scaffold(
      body: latlongData.when(
        error: (err, stack) => Center(
            child: Text(err.toString())),
        loading: () => Center(
            child: TextFrame(comment: 'loading.....')),
        data: (data){
          return SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index){
                  var row = data[index];
                  return Slidable(
                    startActionPane: ActionPane(
                        motion: StretchMotion(),
                        children:[
                          SlidableAction(
                              onPressed: ((context){
                                ref.read(infoProvider.notifier).searchSubway(name: row.subname);
                                Get.dialog(
                                  AlertDialog(
                                    title: DialogDesign(
                                        designText: 'Subway Location'),
                                    content: Container(
                                      width: double.maxFinite,
                                      height: appHeight * 0.52,/// 330
                                      child: MapSample(row.lat, row.lng),
                                    ),
                                  ),
                                );
                              }),
                            backgroundColor: Colors.grey.shade400,
                            foregroundColor: Colors.black,
                            icon: Icons.location_on,
                            label: 'location',
                          ),
                        ]
                    ),
                      endActionPane: ActionPane(
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(onPressed: (onPressed){
                              Get.dialog(
                                AlertDialog(
                                  content: Container(
                                    height: appHeight * 0.369,/// 330
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        DialogDesign(designText: 'civil complaint Box'),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: SmsContainer(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DialogDesignBoxC(
                                            stringNumber: row.line_ui,
                                            subwayName: row.subname,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    DialogButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        comment: 'Cancel'),
                                    SizedBox(
                                      child: SmsFunction(
                                          subwayline: row.subname
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                              backgroundColor: Colors.grey.shade400,
                              foregroundColor: Colors.black,
                              icon: Icons.messenger_outline,
                              label: 'help',
                            ),
                          ]),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        child: Material(
                          child: InkWell(
                            onTap: (){
                              print(row.line_ui);
                              Get.dialog(
                                AlertDialog(
                                  content: initialdata.when(
                                    loading: () => Container(
                                        color: Colors.white,
                                        height: appHeight * 0.42,
                                        alignment: Alignment.center,
                                        child: TextFrame(comment: 'loading.....')),
                                    error: (err, stack) => Text(err.toString()),
                                    data: (data){
                                      ref.read(infoProvider.notifier).searchSubway(name: row.subname, line: row.line_ui);
                                      ref.read(infoProviderB.notifier).searchSubway(name: row.subname);
                                      return SwitchDialogC();
                                    },
                                  ),
                                  actions: [
                                    DialogButton(
                                      comment: 'Select',
                                      onPressed: (){
                                        Fluttertoast.showToast(
                                            msg: '${row.subname}역을 선택하셨습니다',
                                            gravity: ToastGravity.CENTER);
                                        Navigator.pop(context);
                                      },),
                                  ],
                                ),
                              );
                            },
                            child: ListTile(
                              selectedColor: Colors.grey[300],
                              title: Row(
                                children: [
                                  Text('${row.subname}',
                                    style: TextStyle(
                                        fontSize:appHeight * 0.015,
                                        fontWeight:FontWeight.bold,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Text('${row.km?.toStringAsFixed(0)}m',
                                style: TextStyle(
                                    fontSize:appHeight * 0.0165,
                                    fontWeight:FontWeight.bold,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis
                                ),
                              ),
                            ),
                          ),
                        ),
                      ));
                }),
          );

        },
      ),
    );
  }

  Future<bool?> savemsg(String position, String name, String ename)
  => Fluttertoast.showToast(
      msg:'${position} ${name}가 저장되었습니다.\n${ename}',
      gravity: ToastGravity.CENTER);



}
