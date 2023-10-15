// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

class TransferIcon extends ConsumerStatefulWidget {
  const TransferIcon({super.key});

  @override
  ConsumerState<TransferIcon> createState() => _TransferIconState();
}

class _TransferIconState extends ConsumerState<TransferIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if(nameT.isNotEmpty)
        {
          Get.dialog(
              AlertDialog(
                content: Container(
                  height: 90.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DialogDesign(
                        designText: 'RealTime Arrival',
                      ),
                      Container(
                        color: Colors.grey[100],
                        width: double.maxFinite,
                        child: Consumer(
                            builder: (context,ref,child){
                              final filted = ref.watch(filtedarrivalProviderT);
                              return filted.when(
                                loading: () => LoadingBox('loading.....'),
                                error: (err, stack) =>
                                    LoadingBox('데이터를 불러올 수 없습니다'),
                                data: (data){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextFrame(
                                        comment: '\n$lineTT $nameT역\n',
                                      ),
                                      TextFrame(comment: data.upfirst.toString()),
                                      TextFrame(comment: data.uplast.toString()),
                                      TextFrame(comment: data.downfirst.toString()),
                                      TextFrame(comment: data.downlast.toString()),
                                    ],
                                  );
                                },
                              );
                            }),

                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: Text('')),
                          DialogButton(
                              onPressed: (){
                                box.remove('nameT');
                                box.remove('latT');
                                box.remove('lngT');
                                box.remove('engnameT');
                                box.remove('lineT');
                                box.remove('sublistT');
                                box.remove('lineTT');
                                box.remove('headingT');
                                Navigator.pop(context);
                              },
                              comment: 'Erase'),
                          DialogButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              comment: 'Check'),
                        ],
                      ),
                    ],
                  ),
                ),
              )
          );
        }
        else if((nameT.isEmpty)){
          Get.dialog(
              AlertDialog(
              content: Container(
                color: Colors.white,
                height: 73.5.w,  /// 0.27
                child: Column(
                  children: <Widget>[
                    DialogDesign(
                      designText: 'Transfer Station',
                    ),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    InputSubway(
                      onSelected: (value){
                        ref.read(infoProvider.notifier).searchSubway(name: value);
                        Get.dialog(
                          LinePickerB(), ///LinePickerB
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.6.h, /// 90정도
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              onPressed: (){
                                ref.read(storeProviderA.notifier).storeSubData('T');
                                Navigator.of(context).pop();
                              },
                              child: TextFrame(comment: 'Done',color: Colors.black,),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                                padding: MaterialStateProperty.
                                all(EdgeInsets.symmetric(horizontal: 10)),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ],
                ),
              ),
          )
          );
        }
      },

      icon: Icon(Icons.cached_rounded,
        color: switch(box.read('lineT')){
          'Line1' => Color(0xff2a4193), 'Line2' => Color(0xff027a31),
          'Line3' => Color(0xffd75e02), 'Line4' => Color(0xff028bb9),
          'Line5' => Color(0xff9637b6), 'Line6' => Color(0xff885408),
          'Line7' => Color(0xff525d02), 'Line8' => Color(0xfff62d37),
          'Line9' => Color(0xff916a2a), '서해' => Color(0xff8FC31F),
          '공항철도' => Color(0xff0090D2), '경의선' => Color(0xff77C4A3),
          '경춘선' => Color(0xff0C8E72), '수인분당' => Color(0xFFE7E727),
          '신분당' => Color(0xffD4003B), '경강선' => Color(0xff003DA5),
          '인천1선' => Color(0xff7CA8D5), '인천2선' => Color(0xffED8B00),
          '에버라인' => Color(0xff6FB245), '의정부' => Color(0xffFDA600),
          '우이신설' => Color(0xffB7C452), '김포골드' => Color(0xffA17800),
          '신림' => Color(0xff6789CA),
          _ => Colors.black
        },
        size: 6.w,
      ),
    );
  }
}
