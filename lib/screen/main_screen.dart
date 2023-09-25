import '../setting/export.dart';
import '../setting/export+.dart';
import 'main_screen/layout_screen_widget.dart';
import 'table_screen/timetable_screen.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  SharedPreManager sharedPreManager = SharedPreManager();
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
    ref.listen(dustProvider, (previous, next) {
      ref.read(lineProvider.notifier).update((state) =>
      state = ref.watch(dustProvider).elementAtOrNull(0)!.barLevel.toString());
    });
    return LayoutMainScreen(
      colorBar: ColorBar(
        line: ref.watch(lineProvider),
      ),
      dropDown: DropdownCustom(
        value: ref.watch(lineProvider),
        onChanged: (value){
          ref.read(lineProvider.notifier).update((state) => state = value) ;
        },
      ),
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
                        await ref.read(storeProviderA.notifier).storeSubData('A');
                        savemsg('목적지 A', nameA, engA);
                        sharedPreManager.addList(subwayname);
                        addlist(subwayList,subwayname);
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
                        sharedPreManager.addList(subwayname);
                        addlist(subwayList,subwayname);
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
                    Get.dialog( LinePickerA());
                  },
                  onSelectedB: (valueB){
                    setState(() => subwayname = valueB);
                    ref.read(infoProvider.notifier).searchSubway(name: valueB);
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
                        sharedPreManager.addList(subwayname);
                        addlist(subwayList,subwayname);
                      } else if(
                      subwayname == 'SEOUL'){
                        showmsg();
                      }
                    },
                    onLongPress: () async {
                      if(subwayname != 'SEOUL'){
                        await ref.read(storeProviderA.notifier).storeSubData('B');
                        savemsg('목적지 B', nameB, engB);
                        sharedPreManager.addList(subwayname);
                        addlist(subwayList,subwayname);
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
      upandDown: UpandDown(
        color1: ref.watch(convertProvdier) == true ? Colors.grey[100] : Colors.grey[400],
        onTap1: () => ref.read(convertProvdier.notifier).update((state) => state = false),
        color2: ref.watch(convertProvdier) == false ? Colors.grey[100] : Colors.grey[400],
        onTap2: () => ref.read(convertProvdier.notifier).update((state) => state = true),
      ),
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
                    StatefulBuilder(
                        builder: (__,StateSetter setState){
                          return DialogButton(
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
                          );
                        })
                  ],
                ),
              );
            } else {
              showmsg();
            }
          }
          else if(index == 1){
            toggleguide2();
            subwayList = box.read('List').cast<String>().toList() ?? [];
            List<String> sharedList = sharedPreManager.getList();
            List<String> reversed = subwayList.reversed.toSet().toList();
            print(sharedList);
            print(reversed);
            Get.dialog(
              AlertDialog(
                content: SwitchDialogB(
                    reversed.length > sharedList.length
                        ? reversed : sharedList),
                actions: [
                  DialogButton(
                    onPressed: () async {
                      await ref.read(storeProviderA.notifier).storeSubData('A');
                      savemsg('목적지 A', nameA, engA);
                      sharedPreManager.addList(nameA);
                      addlist(subwayList,nameA);
                    },
                    onLongPress: () async {
                      await ref.read(storeProviderA.notifier).storeSubData('B');
                      savemsg('목적지 B', nameB, engB);
                      sharedPreManager.addList(nameB);
                      addlist(subwayList,nameB);
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
                    StatefulBuilder(
                        builder: (__,StateSetter setState){
                      return DialogButton(
                        onPressed: (){
                          var data = DistModel(
                            latA: latB.toString(), lngA: lngB.toString(),
                            latB: latA.toString(), lngB: lngA.toString(),
                            nameA: nameB, nameB: nameA,
                          );
                          ref.read(apiresult(data));
                          ref.read(nameProvider.notifier).state = nameB;
                          ref.read(engNameProvider.notifier).state = engB;
                          ref.read(lineProvider.notifier).state = lineB;
                          ref.read(headingProvider.notifier).state = headB;
                          ref.read(codeConveyProvider.notifier).state = codeA;
                          Navigator.pop(context);
                        },
                        comment: 'Adapt',
                      );
                    }),
                  ],
                ),
              );
            } else {
              showmsg();
            }
          }
        },
      ),
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
                        ? TextFrame(comment: '목적지를 설정해주세요')
                        : TableScreen(
                      name == nameA ? nameB : name == nameB ? nameA : '',
                      eng == engA ? engB : eng == engB ? engA : '',
                    ),
                  ));
            });
      },
    );
  }
  void addlist (List<dynamic> list, String name) async {
    if(list.length <= 5){
      list.add(name);
      await box.write('List', list);
    } else {
      list.removeAt(0);
      await box.write('List', list);
    }
  }
}
