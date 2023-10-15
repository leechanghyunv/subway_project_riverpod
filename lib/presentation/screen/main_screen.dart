// Project imports:
import '../../setting/export.dart';
import '../../setting/export+.dart';
import 'main_screen/layout_screen_widget.dart';
import 'table_screen/timetable_screen.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  SharedPreManager sharedPreManager = SharedPreManager();
  HiveService hiveService = HiveService();
  late String subwayname = 'SEOUL';
  late List<String> subwayList = [];

  @override
  void initState() {
    super.initState();
    sharedPreManager.init();
    sharedPreManager.setFirstLoading(false);

  }


  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dataProviderInside);
    ref.listen(dustProvider, (previous, next) =>
        ref.read(lineProvider.notifier).update((state) =>
      state = ref.watch(dustProvider).elementAtOrNull(0)!.barLevel.toString()));

    return LayoutMainScreen(
      /// 앱 시작시 colorbar의 색상은 미세먼지의 농도를 나타냄
      colorBar: ColorBar(line: ref.watch(lineProvider) ?? 'Line2'),
      dropDown: DropdownCustom(
        value: ref.watch(lineProvider),
        onChanged: (value){
          ref.read(lineProvider.notifier).update((state) => state = value);
        }),
      iconCustom: IconCustom(
        onTap: (){
          iconbuttonguide();
          Get.dialog(
            AlertDialog(
              content: Container(
                color: Colors.white,
                height: Device.aspectRatio >= 0.5 ? 100.w : 84.5.w,
                child: TextFormA(
                  onSelected: (value){
                    setState(() => subwayname = value);
                    ref.read(infoProvider.notifier).searchSubway(name: value);
                    /// LinePicker는 지하철 이름을 검색 후 정확한 호선명을 등록하기 위한 페이지임
                    Get.dialog( LinePickerA());
                  },
                  onSubmitted: (name){
                    ref.read(userNameProvier.notifier).state = name;
                    box.write('name', name);
                  },
                ),
              ),
              actions: [
                DialogButton(
                    onPressed: () async {
                      if(subwayname != 'SEOUL'){
                        /// subData A 는 출발지점을 나타냄 B는 목적지점을 나타냄
                        await ref.read(storeProviderA.notifier).storeSubData('A');
                        savemsg('목적지 A', nameA, engA);
                        hiveService.putBox(ChipModel(name: subwayname));
                        print('box.read codeA $codeA');
                      } else if(
                      subwayname == 'SEOUL'){
                        showmsg();
                      }
                    },
                    onLongPress: () async {
                      if(subwayname != 'SEOUL'){
                        await ref.read(storeProviderA.notifier).storeSubData('B');
                        savemsg('목적지 B', nameB, engB);
                        hiveService.putBox(ChipModel(name: subwayname));
                        print('box.read codeB $codeB');
                      } else if(
                      subwayname == 'SEOUL'){
                        showmsg();
                      }
                    },
                    comment: 'Save'),
                DialogButton(
                    comment: 'Adapt',
                    onPressed: () => Navigator.pop(context)
                ),
              ],
            ),
          );
        },
        onLongPress: (){
          iconbuttonguide2();
          Get.dialog(
            AlertDialog(
              content: Container(
                color: Colors.white,
                height: Device.aspectRatio >= 0.5 ? 115.w : 96.6.w,
                child: TextFormB(
                  onSelectedA: (valueA){
                    setState(() => subwayname = valueA);
                    ref.read(infoProvider.notifier).searchSubway(name: valueA);
                    /// LinePicker는 지하철 이름을 검색 후 정확한 호선명을 등록하기 위한 페이지임
                    Get.dialog( LinePickerA());
                  },
                  onSelectedB: (valueB){
                    setState(() => subwayname = valueB);
                    ref.read(infoProvider.notifier).searchSubway(name: valueB);
                    /// LinePickerB는 환승역에 대한 정보임
                    Get.dialog( LinePickerB());
                  },
                  onSubmitted: (name){
                    ref.read(userNameProvier.notifier).state = name;
                    box.write('name',name);
                  },
                ),
              ),
              actions: [
                DialogButton(
                    onPressed: () async {
                      if(subwayname != 'SEOUL'){
                        await ref.read(storeProviderA.notifier).storeSubData('A');
                        savemsg('목적지 A', nameA, engA);
                        hiveService.putBox(ChipModel(name: subwayname));
                      } else if(
                      subwayname == 'SEOUL'){
                        showmsg();
                      }
                    },
                    onLongPress: () async {
                      if(subwayname != 'SEOUL'){
                        await ref.read(storeProviderA.notifier).storeSubData('B');
                        savemsg('목적지 B', nameB, engB);
                        hiveService.putBox(ChipModel(name: subwayname));
                      } else if(
                      subwayname == 'SEOUL'){
                        showmsg();
                      }
                    },
                    comment: 'Save'),
                DialogButton(
                    comment: 'Adapt',
                    onPressed: () => Navigator.pop(context)
                ),
              ],
            ),
          );
        },
      ),
      /// 의미 없는 object임 언젠가 기능을 채워넣을 것
      upandDown: UpandDown(
        color1: ref.watch(convertProvdier) == true ? Colors.grey[100] : Colors.grey[400],
        onTap1: () => ref.read(convertProvdier.notifier).update((state) => state = false),
        color2: ref.watch(convertProvdier) == false ? Colors.grey[100] : Colors.grey[400],
        onTap2: () => ref.read(convertProvdier.notifier).update((state) => state = true),
      ),
      /// 0,2번은 실시간 이동 경로 및 시간계산 API, 1번은 리스팅,네이버지도,민원신고기능
      toggleCustom: ToggleController(
        onToggle: (index) {
          if(index == 0){
            if(nameA.isNotEmpty || nameB.isNotEmpty){
              toggleguide();
              Get.dialog(
                AlertDialog(
                  content: data.when(
                    loading: () => LoadingBox('loading.....'),
                    error: (err, stack) => LoadingBox(err.toString()),
                    data: (data){
                      ref.read(infoProvider.notifier).searchSubway(name: nameB);
                      return SwitchDialogA(
                          nameB,sublistB.toString(), nameA,lineBB
                      );
                    },
                  ),
                  actions: [
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      comment: 'Cancel',
                    ),
                    DialogButton(
                      onPressed: (){
                        var data = DistModel(
                          latA: latA.toString(), lngA: lngA.toString(),
                          latB: latB.toString(), lngB: lngB.toString(),
                          nameA: nameA, nameB: nameB,
                        );
                        ref.read(apiresult(data));
                        ref.read(nameProvider.notifier).state = nameA;
                        ref.read(engNameProvider.notifier).state = engA;
                        ref.read(lineProvider.notifier).state = lineA;
                        ref.read(headingProvider.notifier).state = headA;
                        ref.read(codeConveyProvider.notifier).state = codeB;
                        Navigator.pop(context);
                      },
                      comment: 'Adapt',
                    ),
                  ],
                ),
              );
            } else {
              showmsg();
            }
          }
          else if(index == 1){
            toggleguide2();
            ref.read(locationProvider.notifier).getlocation();
            List<String> list = chipbox?.values.map((e) => e.name).toSet().toList() ?? [];
            List<String> reversedList = list.reversed.toList();
            Get.dialog(
              AlertDialog(
                content: SwitchDialogB(reversedList),
                actions: [
                  DialogButton(
                    onPressed: () async {
                      await ref.read(storeProviderA.notifier).storeSubData('A');
                      savemsg('목적지 A', nameA, engA);
                      hiveService.putBox(ChipModel(name: nameA));
                      setState(() {});
                    },
                    onLongPress: () async {
                      await ref.read(storeProviderA.notifier).storeSubData('B');
                      savemsg('목적지 B', nameB, engB);
                      hiveService.putBox(ChipModel(name: nameB));
                      setState(() {});
                    },
                    comment: 'Save',
                  ),
                  DialogButton(
                      comment: 'Adapt',
                      onPressed: () => Navigator.pop(context)
                  ),
                ],
              ),
            );
          }
          else if(index == 2){
            if(nameB.isNotEmpty || nameA.isNotEmpty){
              toggleguide();
              Get.dialog(
                AlertDialog(
                  content: data.when(
                    loading: () => LoadingBox('loading.....'),
                    error: (err, stack) => LoadingBox(err.toString()),
                    data: (data){
                      ref.read(infoProvider.notifier).searchSubway(name: nameA);
                      return SwitchDialogA(
                          nameA,sublistA.toString(),nameB,lineAA
                      );
                    },
                  ),
                  actions: [
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      comment: 'Cancel',
                    ),
                      DialogButton(
                        onPressed: (){
                          var data = DistModel(
                            latA: latB.toString(), lngA: lngB.toString(),
                            latB: latA.toString(), lngB: lngA.toString(),
                            nameA: nameB, nameB: nameA);
                          ref.read(apiresult(data));
                          ref.read(nameProvider.notifier).state = nameB;
                          ref.read(engNameProvider.notifier).state = engB;
                          ref.read(lineProvider.notifier).state = lineB;
                          ref.read(headingProvider.notifier).state = headB;
                          ref.read(codeConveyProvider.notifier).state = codeA;
                          Navigator.pop(context);
                          },
                        comment: 'Adapt',
                      ),
                  ],
                ),
              );
            } else {
              showmsg();
            }
          }
        },
      ),
      /// time table page로 넘어감 api를 얻기 위해선 지하철 코드가 필요함
      onTap: (){
        var codeConvey = ref.read(codeConveyProvider.notifier).state;
        var name = ref.read(nameProvider.notifier).state;
        var eng = ref.read(engNameProvider.notifier).state;
        print('codeConvey: $codeConvey');
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context){
              return SizedBox(
                  height: 76.5.h,
                  child: Center(
                    child: codeConvey == ''
                        ? const TextFrame(comment: '목적지를 설정해주세요')
                        : TableScreen(
                      name == nameA ? nameB
                          : name == nameB ? nameA
                          : '',
                      eng == engA ? engB
                          : eng == engB ? engA
                          : '',
                    ),
                  ));
            });
      },
    );
  }
}
