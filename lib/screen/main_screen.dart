import 'package:subway_project_230704/screen/loading_screen.dart';
import 'package:subway_project_230704/setting/export.dart';
import '../api_provider/discance_provider.dart';
import '../api_provider/dust_provider.dart';
import '../model/distance_model.dart';
import 'line_pickerA.dart';
import 'table_screen.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

 class _HomePageState extends ConsumerState<HomePage>  {

   late Future<String> _futureData;
   late List<dynamic> subwayList = [];

   late String subwayname = 'SEOUL';
   late String subwaynameT = 'SEOUL';

  @override
  void initState() {
    super.initState();
    _futureData = _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    double frameWidth = appHeight * 0.49;  /// 414.0 IPHONE11
    double appWidth = appHeight * 0.46;  /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    final data = ref.watch(dataProviderInside);
    final filted = ref.watch(infoProvider);
    ref.listen(dustProvider, (previous, next) {
      ref.read(lineProvier.notifier).update((state) =>
      state = ref.watch(dustProvider).elementAtOrNull(0)!.barLevel.toString());;
    });
    final double dotLength = appRatio >= 0.5 ? 4.5 : 6;
    final double lineThickness = appRatio >= 0.5 ? 5 : 7;
    return FutureBuilder(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingPage();
          } else {
            return LayoutScreen(
              body: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  height: appHeight,
                  width: frameWidth,
                  child: Column(
                    children: <Widget>[
                      TopDesign(),
                      SizedBox(
                        height: appRatio >= 0.5 ? appHeight * 0.665 : appHeight * 0.6,
                        width: appWidth * 0.915,
                        child: Column(
                          children: <Widget>[
                             DottedLine(
                                dashLength: 12, dashGapLength: dotLength, lineThickness: lineThickness,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ColorBar(
                                  stringNumber: ref.watch(lineProvier),
                                ),
                                SizedBox(
                                  width: appWidth * 0.0242,
                                ),
                                DropdownCustom(
                                  value: ref.watch(lineProvier),
                                  onChanged: (value){
                                    ref.read(lineProvier.notifier).update((state) => state = value) ;
                                  },
                                ),
                                SizedBox(
                                  width: appWidth * 0.08447,
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: appRatio >= 0.5 ? appWidth * 0.08447 : appWidth * 0.0604,
                                    ),
                                    IconCustom(
                                      onTap: (){
                                        Get.dialog(
                                          AlertDialog(
                                            content: Container(
                                              color: Colors.white,
                                              height: appRatio >= 0.5 ? appWidth : appWidth * 0.8447, /// 0.3907
                                              child: TextFormA(
                                                onSelected: (value){
                                                  setState(() {
                                                    subwayname = value;
                                                  });
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
                                                      addlist(subwayList,box.read('nameA'));
                                                      Navigator.pop(context);
                                                  } else if(
                                                  subwayname == 'SEOUL'){
                                                    showmsg();
                                                  }
                                                },
                                                onLongPress: () async {
                                                  if(subwayname != 'SEOUL'){
                                                    await ref.read(storeProviderA.notifier).storeSubData('B');
                                                    savemsg('목적지 B', box.read('nameB'), box.read('engnameB'));
                                                    addlist(subwayList,box.read('nameB'));
                                                    Navigator.pop(context);
                                                  } else if(
                                                  subwayname == 'SEOUL'){
                                                    showmsg();
                                                  }
                                                },
                                                comment: 'Save',),
                                              DialogButton(
                                                  comment: 'Adapt',
                                                  onPressed: () => Navigator.pop(context)
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      onLongPress: (){
                                        Get.dialog(
                                          AlertDialog(
                                            content: Container(
                                              color: Colors.white,
                                              height: appRatio >= 0.5 ? appWidth * 1.15 : appWidth * 0.9662,
                                              child: TextFormB(
                                                onSelectedA: (valueA){
                                                  setState(() {
                                                    subwayname = valueA;
                                                  });
                                                  ref.read(infoProvider.notifier).searchSubway(name: valueA);
                                                  Get.dialog(
                                                    LinePickerA(),
                                                  );
                                                },
                                                onSelectedB: (valueB){
                                                  setState(() {
                                                    subwaynameT = valueB;
                                                  });
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
                                                    addlist(subwayList,box.read('nameA'));
                                                    Navigator.pop(context);
                                                  } else if(
                                                  subwayname == 'SEOUL'){
                                                    showmsg();
                                                  }
                                                },
                                                onLongPress: () async {
                                                  if(subwayname != 'SEOUL'){
                                                    await ref.read(storeProviderA.notifier).storeSubData('B');
                                                    savemsg('목적지 B', box.read('nameB'), box.read('engnameB'));
                                                    addlist(subwayList,box.read('nameB'));
                                                    Navigator.pop(context);
                                                  } else if(
                                                  subwayname == 'SEOUL'){
                                                    showmsg();
                                                  }
                                                },
                                                comment: 'Save',),
                                              DialogButton(
                                                  comment: 'Adapt',
                                                  onPressed: () => Navigator.pop(context)
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: appRatio >= 0.5 ? appWidth * 0.0604 : appWidth * 0.0485),
                                    TextContainerA(),
                                    UpandDown(
                                      color1: ref.watch(convertProvier) == true ? Colors.grey[100] : Colors.grey[400],
                                      onTap1: () {
                                        ref.read(convertProvier.notifier).update((state) => state = false);
                                      },
                                      color2: ref.watch(convertProvier) == false ? Colors.grey[100] : Colors.grey[400],
                                      onTap2: ()  {
                                        ref.read(convertProvier.notifier).update((state) => state = true);
                                      },
                                    ),
                                    SizedBox(height: appRatio >= 0.5 ? appWidth * 0.0485 : 0,
                                    ),
                                    TextContainerB(),
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                ToggleController(
                                  onToggle: (index) {
                                    if(index == 0){
                                      if(box.read('nameA') != null || box.read('nameB') != null){
                                        Get.dialog(
                                          AlertDialog(
                                            content: data.when(
                                              loading: () => Container(
                                                  color: Colors.white,
                                                  height: appWidth * 0.9075,
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
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
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
                                                        ref.read(nameProvier.notifier).state = box.read('nameA');
                                                        ref.read(engNameProvier.notifier).state = box.read('engnameA');
                                                        ref.read(lineProvier.notifier).state = box.read('lineA');
                                                        ref.read(headingProvider.notifier).state = box.read('headingA');
                                                        ref.read(codeConveyProvider.notifier).state = box.read('codeB');
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
                                      subwayList = box.read('list') ?? [];
                                      List<dynamic> settedList = subwayList.toSet().toList();
                                      print(settedList);
                                      Get.dialog(
                                        AlertDialog(
                                          content: SwitchDialogB(settedList),
                                          actions: [
                                            DialogButton(
                                              onPressed: () async {
                                                await ref.read(storeProviderA.notifier).storeSubData('A');
                                                savemsg('목적지 A', box.read('nameA'), box.read('engnameA'));
                                                addlist(subwayList,box.read('nameA'));
                                                Navigator.pop(context);
                                              },
                                              onLongPress: () async {
                                                await ref.read(storeProviderA.notifier).storeSubData('B');
                                                savemsg('목적지 B', box.read('nameB'), box.read('engnameB'));
                                                addlist(subwayList,box.read('nameB'));
                                                Navigator.pop(context);
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
                                        Get.dialog(
                                          AlertDialog(
                                            content: data.when(
                                              loading: () => Container(
                                                  color: Colors.white,
                                                  height: appWidth * 0.9075,
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
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                },
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
                                                    ref.read(nameProvier.notifier).state = box.read('nameB');
                                                    ref.read(engNameProvier.notifier).state = box.read('engnameB');
                                                    ref.read(lineProvier.notifier).state = box.read('lineB');
                                                    ref.read(headingProvider.notifier).state = box.read('headingB');
                                                    ref.read(codeConveyProvider.notifier).state = box.read('codeA');
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      BottomDesign(
                        onTap: (){
                          var codeConvey = ref.read(codeConveyProvider.notifier).state;
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context){
                                return SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.765,
                                    child:  Center(
                                      child: codeConvey == ''
                                          ? TextFrame(comment: '목적지를 설정해주세요')
                                          : TableScreen(
                                          ref.read(nameProvier.notifier).state == box.read('nameA') ? box.read('nameB')
                                              :  ref.read(nameProvier.notifier).state == box.read('nameB')
                                              ? box.read('nameA')
                                              : '',

                                          ref.read(engNameProvier.notifier).state == box.read('engnameA') ? box.read('engnameB')
                                              : ref.read(engNameProvier.notifier).state == box.read('engnameB')
                                              ? box.read('engnameA')
                                              : '',
                                      ),
                                    ));
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }
        );
  }

   void addlist (List<dynamic> list,String name){
     if(list.length <= 5){
       list.add(name);
       box.write('list', list);
     } else {

       list.removeAt(0);
       box.write('list', list);
     }
   }

  Future<String> _fetchData() async {
    await Future.delayed(Duration(milliseconds: 1950));
    return "Data loaded successfully";
  }

   Future<bool?> savemsg(String position, String name, String ename) async
   => await Fluttertoast.showToast(
       msg:'${position} ${name}역 저장되었습니다.\n${ename}',
       gravity: ToastGravity.CENTER);


  Future<bool?> showmsg() => Fluttertoast.showToast(
      msg:'목적지를 입력해주세요',
      gravity: ToastGravity.CENTER);



}

