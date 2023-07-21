import 'package:subway_project_230704/screen/LoadingScreen.dart';
import 'package:subway_project_230704/setting/Export.dart';
import '../model/DistModel.dart';
import 'LinePickerA.dart';
import 'TableScreen.dart';



class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}


 class _HomePageState extends ConsumerState<HomePage>  {

   late Future<String> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    late List<dynamic> subwayList = [];
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;  /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;  /// 520   ~ 519.68
    final data = ref.watch(dataProviderInside);
    final filted = ref.watch(infoProvider);
    ref.listen(dustProvider, (previous, next) {
      ref.read(lineProvier.notifier).update((state) =>
      state = ref.watch(dustProvider).elementAtOrNull(0)!.barLevel.toString());
    });

    return FutureBuilder(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingPage();
          } else {
            return LayoutScreen(
              body: Center(
                child: Column(
                  children: <Widget>[
                    TopDesign(),
                    SizedBox(
                      height: appHeight * 0.60,
                      width: appWidth * 0.915,
                      child: Column(
                        children: <Widget>[
                          const DottedLine(
                              dashLength: 15, dashGapLength: 6, lineThickness: 7
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ColorBar(
                                stringNumber: ref.watch(lineProvier),
                              ),
                              SizedBox(
                                width: mainBoxHeight / 50,
                              ),
                              DropdownCustom(
                                value: ref.watch(lineProvier),
                                onChanged: (value){
                                  ref.read(lineProvier.notifier).update((state) => state = value) ;
                                },
                              ),
                              SizedBox(
                                width: appRatio >= 0.5 ? mainBoxHeight / 6 : mainBoxHeight / 15,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: mainBoxHeight / 20,
                                  ),
                                  IconCustom(
                                    onTap: (){
                                      Get.dialog(
                                        AlertDialog(
                                          content: Container(
                                            color: Colors.white,
                                            height: appHeight * 0.3907, /// 0.3907
                                            child: TextFormA(
                                              onSelected: (value){
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
                                              onPressed: (){
                                                if(filted.first.subname != 'SEOUL'){
                                                  ref.read(storeProviderA.notifier).storeSubData('A');
                                                  addlist(subwayList,filted.first.subname); /// state.first.subname
                                                  Navigator.pop(context);
                                                } else if(filted.first.subname == 'SEOUL'){
                                                  showmsg();
                                                }
                                              },
                                              onLongPress: (){
                                                if(filted.first.subname != 'SEOUL'){
                                                  ref.read(storeProviderA.notifier).storeSubData('B');
                                                  addlist(subwayList,filted.first.subname);
                                                  Navigator.pop(context);
                                                } else if(filted.first.subname != 'SEOUL'){
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
                                            height: appHeight * 0.45,
                                            child: TextFormB(
                                              onSelectedA: (valueA){
                                                ref.read(infoProvider.notifier).searchSubway(name: valueA);
                                                Get.dialog(
                                                  LinePickerA(),
                                                );
                                              },
                                              onSelectedB: (valueB){
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
                                              onPressed: (){
                                                if(filted.first.subname != 'SEOUL'){
                                                  ref.read(storeProviderA.notifier).storeSubData('A');
                                                  addlist(subwayList,filted.first.subname);
                                                  Navigator.pop(context);
                                                } else if(filted.first.subname == 'SEOUL'){
                                                  showmsg();
                                                }
                                              },
                                              onLongPress: (){
                                                if(filted.first.subname != 'SEOUL'){
                                                  ref.read(storeProviderA.notifier).storeSubData('B');
                                                  addlist(subwayList,filted.first.subname);
                                                  Navigator.pop(context);
                                                } else if(filted.first.subname != 'SEOUL'){
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
                                  SizedBox(height: mainBoxHeight / 20,),
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
                                                height: appHeight * 0.42,
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
                                                      print('call data');
                                                      var data = DistModel(
                                                        latA: box.read('latA').toString(),
                                                        lngA: box.read('lngA').toString(),
                                                        latB: box.read('latA').toString(),
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
                                    Get.dialog(
                                      AlertDialog(
                                        content: SwitchDialogB(subwayList),
                                        actions: [
                                          DialogButton(
                                            onPressed: () {
                                              if(filted.first.subname != 'SEOUL'){
                                                ref.read(storeProviderA.notifier).storeSubData('A');
                                                addlist(subwayList,filted.first.subname);
                                                Navigator.pop(context);
                                              } else if(filted.first.subname == 'SEOUL'){
                                                showmsg();
                                              }
                                            },
                                            onLongPress: (){
                                              if(filted.first.subname != 'SEOUL'){
                                                ref.read(storeProviderA.notifier).storeSubData('B');
                                                addlist(subwayList,filted.first.subname);
                                                Navigator.pop(context);
                                              } else if(filted.first.subname != 'SEOUL'){
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
                                  }else if(index == 2){
                                    if(box.read('nameB') != null || box.read('nameA') != null){
                                      Get.dialog(
                                        AlertDialog(
                                          content: data.when(
                                            loading: () => Container(
                                                color: Colors.white,
                                                height: appHeight * 0.42,
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
                                                    lngB: box.read('lngB').toString(),
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
                                        : TableScreen(),
                                  ));
                            });
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        }
        );
  }


  Future<String> _fetchData() async {
    await Future.delayed(Duration(milliseconds: 1950));
    return "Data loaded successfully";
  }

  Future<bool?> showmsg() => Fluttertoast.showToast(
      msg:'목적지를 입력해주세요',
      gravity: ToastGravity.CENTER);

void addlist (List<dynamic> list,String name){
  if(list.length <= 5){
    list.add(name);
    box.write('list', list);
  } else {
    list.removeAt(0);
    box.write('list', list);
  }
}
}

