import '../setting/export.dart';
import '../setting/export+.dart';
import 'main_screen/layout_screen_widget.dart';
import 'table_screen.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  SharedPreManager sharedPreManager = SharedPreManager();
  late String subwayname = 'SEOUL';

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
        stringNumber: ref.watch(lineProvider),
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
                    Get.dialog(
                      LinePickerA(),
                    );
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
                        savemsg('목적지 A', box.read('nameA'), box.read('engnameA'));
                        sharedPreManager.addList(box.read('nameA'));
                        print('box.read codeA ${box.read('codeA')}');
                      } else if(
                      subwayname == 'SEOUL'){
                        showmsg();
                      }
                    },
                    onLongPress: () async {
                      if(subwayname != 'SEOUL'){
                        await ref.read(storeProviderA.notifier).storeSubData('B');
                        savemsg('목적지 B', box.read('nameB'), box.read('engnameB'));
                        sharedPreManager.addList(box.read('nameB'));
                        print('box.read codeA ${box.read('codeB')}');
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
                    Get.dialog(
                      LinePickerA(),
                    );
                  },
                  onSelectedB: (valueB){
                    setState(() => subwayname = valueB);
                    ref.read(infoProvider.notifier).searchSubway(name: valueB);
                    Get.dialog(
                      LinePickerB(),
                    );
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
                        savemsg('목적지 A', box.read('nameA'), box.read('engnameA'));
                        sharedPreManager.addList(box.read('nameA'));
                      } else if(
                      subwayname == 'SEOUL'){
                        showmsg();
                      }
                    },
                    onLongPress: () async {
                      if(subwayname != 'SEOUL'){
                        await ref.read(storeProviderA.notifier).storeSubData('B');
                        savemsg('목적지 B', box.read('nameB'), box.read('engnameB'));
                        sharedPreManager.addList(box.read('nameB'));
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
        onTap1: () {
          ref.read(convertProvdier.notifier).update((state) => state = false);
        },
        color2: ref.watch(convertProvdier) == false ? Colors.grey[100] : Colors.grey[400],
        onTap2: ()  {
          ref.read(convertProvdier.notifier).update((state) => state = true);
        },
      ),
      toggleCustom: ToggleController(
        onToggle: (index) {
          if(index == 0){
            if(box.read('nameA') != null || box.read('nameB') != null){
              toggleguide();
              Get.dialog(
                AlertDialog(
                  content: data.when(
                    loading: () => Container(
                        color: Colors.white,
                        height: 90.w,
                        alignment: Alignment.center,
                        child: const TextFrame(comment: 'loading.....')),
                    error: (err, stack) => Text(err.toString()),
                    data: (data){
                      ref.read(infoProvider.notifier).searchSubway(name: box.read('nameB'));
                      return SwitchDialogA(box.read('nameB'),box.read('sublistB'),box.read('nameA'),box.read('lineBB'));
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
                                latA: box.read('latA').toString(),
                                lngA: box.read('lngA').toString(),
                                latB: box.read('latB').toString(),
                                lngB: box.read('lngB').toString(),
                                nameA: box.read('nameA'),
                                nameB: box.read('nameB'),
                              );
                              ref.read(apiresult(data));
                              ref.read(nameProvider.notifier).state = box.read('nameA') ?? '';
                              ref.read(engNameProvider.notifier).state = box.read('engnameA') ?? '';
                              ref.read(lineProvider.notifier).state = box.read('lineA') ?? '';
                              ref.read(headingProvider.notifier).state = box.read('headingA') ?? '';
                              ref.read(codeConveyProvider.notifier).state = box.read('codeB') ?? '';
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
          }else if(index == 1){
            toggleguide2();
            print(sharedPreManager.getList());
            Get.dialog(
              AlertDialog(
                content: SwitchDialogB(sharedPreManager.getList()),
                actions: [
                  DialogButton(
                    onPressed: () async {
                      await ref.read(storeProviderA.notifier).storeSubData('A');
                      savemsg('목적지 A', box.read('nameA'), box.read('engnameA'));
                      sharedPreManager.addList(box.read('nameA'));
                    },
                    onLongPress: () async {
                      await ref.read(storeProviderA.notifier).storeSubData('B');
                      savemsg('목적지 B', box.read('nameB'), box.read('engnameB'));
                      sharedPreManager.addList(box.read('nameB'));
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
          }else if(index == 2){
            if(box.read('nameB') != null || box.read('nameA') != null){
              toggleguide();
              Get.dialog(
                AlertDialog(
                  content: data.when(
                    loading: () => Container(
                        color: Colors.white,
                        height: 90.w,
                        alignment: Alignment.center,
                        child: const TextFrame(comment: 'loading.....')),
                    error: (err, stack) => Text(err.toString()),
                    data: (data){
                      ref.read(infoProvider.notifier).searchSubway(name: box.read('nameA'));
                      return SwitchDialogA(box.read('nameA'),box.read('sublistA'),box.read('nameB'),box.read('lineAA'));
                    },
                  ),
                  actions: [
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      comment: 'Cancel',
                    ),
                    StatefulBuilder(builder: (__,StateSetter setState){
                      return DialogButton(
                        onPressed: (){
                          var data = DistModel(
                            latA: box.read('latB').toString(),
                            lngA: box.read('lngB').toString(),
                            latB: box.read('latA').toString(),
                            lngB: box.read('lngA').toString(),
                            nameA: box.read('nameB'),
                            nameB: box.read('nameA'),
                          );
                          ref.read(apiresult(data));
                          ref.read(nameProvider.notifier).state = box.read('nameB') ?? '';
                          ref.read(engNameProvider.notifier).state = box.read('engnameB') ?? '';
                          ref.read(lineProvider.notifier).state = box.read('lineB') ?? '';
                          ref.read(headingProvider.notifier).state = box.read('headingB') ?? '';
                          ref.read(codeConveyProvider.notifier).state = box.read('codeA') ?? '';
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
        },
      ),
      onTap: (){
        var codeConvey = ref.read(codeConveyProvider.notifier).state;
        var name = ref.read(nameProvider.notifier).state;
        var eng = ref.read(engNameProvider.notifier).state;
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
                      name == box.read('nameA')
                          ? box.read('nameB')
                          : name == box.read('nameB') ? box.read('nameA') : '',

                      eng == box.read('engnameA')
                          ? box.read('engnameB')
                          : eng == box.read('engnameB') ? box.read('engnameA') : '',
                    ),
                  ));
            });
      },
    );
  }
}
