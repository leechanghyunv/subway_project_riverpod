// Project imports:

import '../../setting/export.dart';
import '../../setting/export+.dart';
import 'map_screen/map_screen.dart';

/// 호선정보 등등을 필터링합니다.

class DialogPage extends ConsumerWidget {
   DialogPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final latlongData = ref.watch(latlngProvider);
    /// 디바이스의 위치와 내부데이터의 position 정보를 비교해 현재 위치와 가장 가까운 지하철역 리스팅
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
                    /// Naver Map을 보여주는 부분
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
                    /// 민원신고부분을 불러오는 부분
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
                    /// 리스팅된 지하철역들을 탭하면 실시간 지하철 정보를 보여주도록 설계된 부분
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
                                      /// SwitchDialogC에 실시간 열차 데이터를 불러오기위해 콜백
                                      ref.read(infoProviderB.notifier).
                                      searchSubway(name: row.subname);
                                      /// infoProviderB는 popupmenubutton을 구성하기 위해 콜백함
                                      /// ex 가산디지털단지 1호선,7호선 모두 포함되어야함 이 정보를 가져오기위함
                                      /// SwitchDialogC에서 보여짐
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
