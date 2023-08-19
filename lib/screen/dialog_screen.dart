import 'package:subway_project_230704/setting/export.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'map_screen.dart';

class DialogPage extends ConsumerWidget {
   DialogPage({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double appRatio = MediaQuery.of(context).size.aspectRatio;
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
                                      height: appRatio >= 0.5 ? appWidth * 0.95 : appWidth * 1.1,/// 330
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
                              smsguide();
                              Get.dialog(
                                AlertDialog(
                                  content: Container(
                                    height: appWidth * 0.89, /// 330 // 0.7971
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        DialogDesign(designText: 'civil complaint Box'),
                                         Padding(
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
                                        height: appWidth * 0.9075,
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
                                      comment: 'Cencel',
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    ),
                                    DialogButton(
                                      comment: 'Select',
                                      onPressed: (){
                                        Select(row.subname);
                                        Navigator.pop(context);
                                      },
                                    ),
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
                                        fontSize: appWidth * 0.0338,
                                        fontWeight:FontWeight.bold,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Text('${row.km?.toStringAsFixed(0)}m',
                                style: TextStyle(
                                    fontSize: appWidth * 0.0338,
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


}
