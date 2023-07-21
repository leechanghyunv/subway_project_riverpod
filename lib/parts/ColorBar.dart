import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:subway_project_230704/custom/DialogButton.dart';
import 'package:subway_project_230704/model/DustModel.dart';
import '../custom/QuestionBox.dart';
import '../custom/QuestionTileBox.dart';
import '../custom/TextFrame.dart';
import '../model/UserModel.dart';
import '../model/WeatherModel.dart';
import '../setting/GoogleServey.dart';
import 'ColorContainer.dart';
import 'QrContainer.dart';

class ColorBar extends ConsumerWidget {

  final String stringNumber;

  ColorBar({super.key, required this.stringNumber});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    String q1 = '', q2 = '',  q3 = '', q4 = '', q5 = '', q6 = '';

    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double mainBoxHeight = appHeight * 0.58;
    final temp = ref.watch(tempProvider); ///temp
    final svg = ref.watch(svgProvider); /// icon
    final dustlevel = ref.watch(dustLevelProvider);
    final dust = ref.watch(dustProvider);

    return Column(
      children: [
        SizedBox(
          height: mainBoxHeight / 20,
        ),
        GestureDetector(
          onTap: (){
            Get.snackbar(
              'Snackbar Title',
              'This is a snackbar message',
              icon: svg.when(
                loading: () => const Icon(Icons.question_mark),
                error: (err, stack) => Text(err.toString()),
                data: (data){
                  return data;
                },
              ),
              titleText: dustlevel.when(
                loading: () =>  TextFrame(comment: 'loading.....'),
                error: (err, stack) => Text(err.toString()),
                data: (data){
                  return Row(
                    children: [
                      TextFrame(
                          comment: '미세먼지농도 ${data.elementAtOrNull(0)!.pm10.toString()}pm  ${dust.first.commnet.toString()}',
                          overflow: TextOverflow.fade),
                    ],
                  );
                },
              ),
              messageText: Row(
                children: [
                  TextFrame(comment: '현재온도'),
                  SizedBox(width: 8.0),
                  temp.when(
                    loading: () => const Center(
                        child: TextFrame(comment: 'loading.....')),
                    error: (err, stack) => Text(err.toString()),
                    data: (data){
                      return TextFrame(comment: '${(data.temp - 273.15).toStringAsFixed(1)}\u2103');
                    },
                  ),
                ],
              ),
              mainButton: TextButton(
                  onPressed: (){
                    Get.dialog(
                        AlertDialog(
                          content: StatefulBuilder(builder: (__,StateSetter setState){
                            return SingleChildScrollView(
                                child: Container(
                                  width: double.maxFinite,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      DialogDesign(
                                        designText: '스크롤로 화면을 내려주세요',
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      QuestionTile(
                                        text: '성별을 선택해주세요',
                                        onSelected: (String, index, isSelected) {
                                          setState(() {
                                            const map = {
                                              0:"남자", 1:"여자",
                                            };
                                            q1 = map[index] ?? '';
                                            print('q1: ${q1}');
                                          });
                                        },
                                        buttons: ["남자", "여자",],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      QuestionTile(
                                        text: '나이대를 선택해주세요',
                                        onSelected: (String, index, isSelected) {
                                          setState(() {
                                            const map = {
                                              0:"20~25세", 1:"25~30세", 2:"30~35세", 3:"35~40세", 4:"40~45세", 5:"45~50세",
                                            };
                                            q2 = map[index] ?? '';
                                            print('q2: ${q2}');
                                          });
                                        },
                                        buttons: ["20~25", "25~30", "30~35","35~40","40~45","45~50"],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      QuestionTile(
                                        text: '지하철 사용빈도를 알려주세요',
                                        onSelected: (String, index, isSelected) {
                                          setState(() {
                                            const map = {
                                              0:"주1~2회", 1:"주3~4회", 2:"주5회이상",3:"매일사용",
                                            };
                                            q3 = map[index] ?? '';
                                            print('q3: ${q3}');
                                          });
                                        },
                                        buttons: ["주1~2회", "주3~4회", "주5회이상","매일사용"],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      QuestionTile(
                                        text: '가장 유용하게 사용했던 기능은?',
                                        onSelected: (String, index, isSelected) {
                                          setState(() {
                                            const map = {
                                              0:"미세먼지농도,날씨확인", 1:"실시간 도착정보", 2:"민원기능", 3:"열차시간표", 4:"도착시간알람",
                                            };
                                            q4 = map[index] ?? '';
                                            print('q4: ${q4}');
                                          });
                                        },
                                        buttons: ["미세먼지농도,날씨확인", "실시간도착정보", "문자민원","열차시간표","도착알람"],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      QuestionTile(
                                        text: '불편했던점이 있었나요?',
                                        onSelected: (String, index, isSelected) {
                                          setState(() {
                                            const map = {
                                              0:"불편한 사용방법", 1:"정보 신뢰도", 2:"지하철노선도없음", 4:"원하는정보없음",
                                            };
                                            q5 = map[index] ?? '';
                                            print('q5: ${q5}');
                                          });
                                        },
                                        buttons: ["불편한 사용방법", "정보 신뢰도","지하철노선도없음","원하는정보없음"],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      QuestionBox(
                                        text: '개선되었으면 하는 점은?',
                                        onSubmitted: (val){
                                          setState(() {
                                            q6 = val;
                                            print('q6: ${q6}');
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                          width: double.maxFinite,
                                          color: Colors.grey[300],
                                          child: DialogButton(
                                              onPressed: () async {
                                                final id = await GoogleSheetsData.rowcount() + 1;
                                                final time = DateFormat('y-MM-dd EEE').format(DateTime.now());
                                                final user = UserFields(
                                                  id: id, gender: q1, age: q2,
                                                  frequency: q3, goodthing: q4,
                                                  unconfortable: q5, comment1: q6,
                                                  currentTime: time.toString(),
                                                );
                                                print('time : ${time}');
                                                await GoogleSheetsData.insert(
                                                    [user.toJson()]);
                                                Fluttertoast.showToast(
                                                    msg: '의견이 전달되었습니다',
                                                    gravity: ToastGravity.CENTER);
                                                Navigator.pop(context);
                                              },
                                              comment: '의견을 제출해주세요')),
                                    ],
                                  ),
                                ));
                          }),



                    )
                    );
              },
                  child: TextFrame(
                    comment: '설문조사',
                    color: Colors.black,)),
              backgroundColor: Colors.grey[200],
              shouldIconPulse: true,
              duration: Duration(seconds: 5),
            );
          },
          child: SizedBox(
            height: appHeight * 0.58 * 0.90,
            width: appWidth * 0.08,
            child: ColorContainer(
                stringNumber: stringNumber
            ),
          ),
        )
      ],
    );
  }
}
