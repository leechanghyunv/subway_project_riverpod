import 'package:subway_project_230704/custom/InputSubway.dart';
import '../model/ArrivalModel.dart';
import '../model/WeatherModel.dart';
import '../parts/QrContainer.dart';
import '../screen/LinePickerA.dart';
import '../setting/Export.dart';

class TransferIcon extends ConsumerStatefulWidget {
  const TransferIcon({super.key});

  @override
  ConsumerState<TransferIcon> createState() => _TransferIconState();
}

class _TransferIconState extends ConsumerState<TransferIcon> {
  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height; ///  896.0 IPHONE11
    final arrivel = ref.watch(arrivalProviderT);
    final temp = ref.watch(tempProvider);
    final svg = ref.watch(svgProvider);
    return IconButton(
      onPressed: () async {
        if(box.read('nameT') != null){
          Get.dialog(
              AlertDialog(
                content: Container(
                  height: appHeight * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DialogDesign(
                        designText: 'RealTime Arrival T',
                      ),
                      Container(
                        color: Colors.grey[100],
                        width: double.maxFinite,
                        child: arrivel.when(
                          loading: () => TextFrame(comment: 'loading.....'),
                          error: (err, stack) => Text(err.toString()),
                          data: (data) {
                            try {
                              var filtedArrival = data
                                  .where((element) => element.subwayId == box.read('sublistT')).toList();
                              var updnLine1 = ['상행', '내선'], updnLine2 = ['하행', '외선'];
                              var updn1First = filtedArrival
                                  .where(
                                      (element) => updnLine1.contains(element.updnLine))
                                  .map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first;
                              var updn1Last = filtedArrival
                                  .where(
                                      (element) => updnLine1.contains(element.updnLine))
                                  .map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last;
                              var updn2First = filtedArrival
                                  .where(
                                      (element) => updnLine2.contains(element.updnLine))
                                  .map((e) => '${e.trainLineNm} ${e.arvlMsg2}').first;
                              var updn2Last = filtedArrival
                                  .where(
                                      (element) => updnLine2.contains(element.updnLine))
                                  .map((e) => '${e.trainLineNm} ${e.arvlMsg2}\n').last;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFrame(
                                    comment: '\n${box.read('lineTT')} ${box.read('nameT')}역\n',
                                  ),
                                  
                                  TextFrame(comment: updn1First.toString()),
                                  TextFrame(comment: updn1Last.toString()),
                                  TextFrame(comment: updn2First.toString()),
                                  TextFrame(comment: updn2Last.toString()),
                                ],
                              );
                            } catch (e) {
                              return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: TextFrame(comment: '실시간 데이터를 가져올 수 없습니다.'),
                                  ));
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
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
        }else if((box.read('nameT') == null)){
          Get.dialog(
              AlertDialog(
              content: Container(
                color: Colors.white,
                height: appHeight * 0.34,  /// 0.27
                child: Column(
                  children: <Widget>[
                    DialogDesign(
                      designText: 'Transfer Station',
                    ),
                    SizedBox(
                      height: appHeight * 0.0112,
                    ),
                    InputSubway(
                      onSelected: (value){
                        ref.read(infoProvider.notifier).searchSubway(name: value);
                        Get.dialog(
                          LinePickerA(),
                        );
                      },
                    ),
                    SizedBox(
                      height: appHeight * 0.1068, /// 90정도
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
                                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
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
        color: box.read('lineT') == 'Line1'? const Color(0xff2a4193)
            : box.read('lineT') == 'Line2'?  const Color(0xff027a31)
            : box.read('lineT') == 'Line3'?  const Color(0xffd75e02)
            : box.read('lineT') == 'Line4'?  const Color(0xff028bb9)
            : box.read('lineT') == 'Line5'?  const Color(0xff9637b6)
            : box.read('lineT') == 'Line6'?  const Color(0xff885408)
            : box.read('lineT') == 'Line7'?  const Color(0xff525d02)
            : box.read('lineT') == 'Line8'?  const Color(0xfff62d37)
            : box.read('lineT') == 'Line9'?  const Color(0xff916a2a)
            // : box.read('lineT') == '서해'?    const Color(0xff8FC31F)
            // : box.read('lineT') == '공항철도'?    const Color(0xff0090D2)
            : box.read('lineT') == '경의선'? const Color(0xff77C4A3)
            : box.read('lineT') == '경춘선'?    const Color(0xff0C8E72)
            : box.read('lineT') == '수인분당'? const Color(0xFFE7E727)
            : box.read('lineT') == '신분당'?   const Color(0xffD4003B)
            // : box.read('lineT') == '경강선'?   const Color(0xff003DA5)
            // : box.read('lineT') == '인천1선'?  const Color(0xff7CA8D5)
            // : box.read('lineT') == '인천2선'?  const Color(0xffED8B00)
            // : box.read('lineT') == '에버라인'?  const Color(0xff6FB245)
            // : box.read('lineT') == '의정부'?   const Color(0xffFDA600)
            // : box.read('lineT') == '우이신설'? const Color(0xffB7C452)
            // : box.read('lineT') == '김포골드'? const Color(0xffA17800)
            // : box.read('lineT') == '신림'?   const Color(0xff6789CA)
            : Colors.black,
      ),

    );
  }
}
