// Project imports:

import '../../setting/export.dart';
import '../../setting/export+.dart';
import 'map_screen.dart';

class DialogPage extends ConsumerWidget {
   DialogPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final latlongData = ref.watch(latlngProvider);
    final initialdata = ref.watch(dataProviderInside);
    return Scaffold(
      body: latlongData.when(
        error: (err, stack) => LoadingBox(err.toString()),
        loading: () => LoadingBox('loading.....'),
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
                                ref.read(infoProvider.notifier).
                                searchSubway(name: row.subname);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                          title: DialogDesign(
                                              designText: 'Subway Location'),
                                          content: Container(
                                            width: double.maxFinite,
                                            height: Device.aspectRatio >= 0.5
                                                ? 100.w
                                                : 120.w,
                                            child: MapSample(row.lat, row.lng),
                                          ),
                                          actions: [
                                            Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: DialogButton(
                                                  onPressed: () => Navigator.pop(context),
                                                  comment: 'Done'),
                                            ),
                                          ],
                                        );
                                });
                              }),
                            backgroundColor: Colors.grey.shade400,
                            foregroundColor: Colors.black,
                            icon: Icons.location_on,
                            label: 'Map',
                          ),
                        ]
                    ),
                      endActionPane: ActionPane(
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (onPressed){
                              smsguide();
                              Get.dialog(
                                AlertDialog(
                                  content: Container(
                                    height: 89.w,
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
                                            line: row.line_ui,
                                            name: row.subname,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    DialogButton(
                                        onPressed: () => Navigator.pop(context),
                                        comment: 'Cancel'),
                                    SizedBox(
                                      child: SmsFunction(
                                          line: row.line_ui
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
                                    loading: () => LoadingBox('loading.....'),
                                    error: (err, stack) => LoadingBox(err.toString()),
                                    data: (data){
                                      ref.read(infoProvider.notifier).
                                      searchSubway(name: row.subname, line: row.line_ui);

                                      ref.read(infoProviderB.notifier).
                                      searchSubway(name: row.subname);
                                      return SwitchDialogC();
                                    },
                                  ),
                                  actions: [
                                    DialogButton(
                                      comment: 'Cencel',
                                      onPressed: () => Navigator.pop(context)),
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
                                  Text(row.subname,
                                    style: dialogcommon,
                                  ),
                                ],
                              ),
                              trailing: Text(
                                '${row.km?.toStringAsFixed(0)}m',
                                style: dialogcommon,
                              ),
                            ),
                          ),
                        ),
                      ),
                  );
                }),
          );
        },
      ),
    );
  }
}
