import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class TextContainerA extends ConsumerWidget {

  late final String subNumber;
  late final String subState;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final common = TextStyle(
      fontSize: Device.aspectRatio >= 0.5 ? 19.sp : 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    final state = ref.watch(lineProvider);
    return Container(
      color: Colors.transparent,
      width:  48.w,
      height: Device.aspectRatio >= 0.5 ? 7.8.h : 6.85.h,
      child: Center(
        child: Row(
            children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToopTipWidget(
                message: '(열차번호)C0:진입\n(열차번호)C1:도착\n(열차번호)C2:출발\n(열차번호)C3:전역출발\n(열차번호)C4:전역진입\n(열차번호)C5:전역도착\n(열차번호)C99:운행중',
                child: Text('NUMBER',
                  style: common,
                ),
              ),
              SizedBox(height: 2.w,
              ),
              Consumer(builder: (context, ref, widget){
                final upDown = ref.watch(upDownProvider);
                if(upDown == 1){
                  return ToopTipWidget(
                    message: '(열차번호)C0:진입\n(열차번호)C1:도착\n(열차번호)C2:출발\n(열차번호)C3:전역출발\n(열차번호)C4:전역진입\n(열차번호)C5:전역도착\n(열차번호)C99:운행중',
                    child: Text('${box.read('subNumber1')}C${box.read('subState1')}',
                      style: common,
                    ),
                  );
                }else if(upDown == -1){
                  return ToopTipWidget(
                    message: '(열차번호)C0:진입\n(열차번호)C1:도착\n(열차번호)C2:출발\n(열차번호)C3:전역출발\n(열차번호)C4:전역진입\n(열차번호)C5:전역도착\n(열차번호)C99:운행중',
                    child: Text('${box.read('subNumber2')}C${box.read('subState2')}',
                      style: common,
                    ),
                  );
                }
                return ToopTipWidget(
                  message: '(열차번호)C0:진입\n(열차번호)C1:도착\n(열차번호)C2:출발\n(열차번호)C3:전역출발\n(열차번호)C4:전역진입\n(열차번호)C5:전역도착\n(열차번호)C99:운행중',
                  child: Text('3728C99',
                    style: common,
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            width: 6.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToopTipWidget(
                message: '열차에서 내리는 방향\n급행열차(반대방향)',
                child: Text(
                  'GATE',
                  style: common,
                ),
              ),

              SizedBox(
                height: 2.w,
              ),

              ToopTipWidget(
                message: '열차에서 내리는 방향\n급행열차(반대방향)',
                child: Consumer(
                    builder: (context,ref,widget){
                      final gateText = ref.watch(headingProvider);
                      return RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text:
                              gateText == 'RIGHT' ? 'RIGH'
                                  : gateText == 'LEFT' ? 'L'
                                  : gateText == null ? '01'
                                  : '01',
                              style: TextStyle(
                                  color: gateText == 'LEFT'
                                      ? headingColor(state)
                                      : Colors.black,
                                  fontSize: Device.aspectRatio >= 0.5 ? 19.sp : 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),

                            TextSpan(
                              text:
                              gateText == 'RIGHT' ? 'T'
                                  : gateText == 'LEFT' ? 'EFT'
                                  : gateText == null ? '00'
                                  : '00',
                              style: TextStyle(
                                  color: gateText == 'RIGHT' ? headingColor(state)
                                      : Colors.black,
                                  fontSize: Device.aspectRatio >= 0.5 ? 19.sp : 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

            ],
          ),
        ]),
      ),
    );
  }



  Color headingColor (String heading) {
    return  heading == 'Line1' ? Color(0xff2a4193)
          : heading == 'Line2' ? Color(0xff027a31)
          : heading == 'Line3' ? Color(0xffd75e02)
          : heading == 'Line4' ? Color(0xff028bb9)
          : heading == 'Line5' ? Color(0xff9637b6)
          : heading == 'Line6' ? Color(0xff885408)
          : heading == 'Line7' ? Color(0xff525d02)
          : heading == 'Line8' ? Color(0xfff62d37)
          : heading == 'Line9' ? Color(0xff916a2a)
          : heading == '서해' ? Color(0xff8FC31F)
          : heading == '공항철도' ? Color(0xff0090D2)
          : heading == '경의선' ? Color(0xff77C4A3)
          : heading == '경춘선' ? Color(0xff0C8E72)
          : heading == '수인분당' ? Color(0xFFE7E727)
          : heading == '신분당' ? Color(0xffD4003B)
          : heading == '경강선' ? Color(0xff003DA5)
          : heading == '인천1선' ? Color(0xff7CA8D5)
          : heading == '인천2선' ? Color(0xffED8B00)
          : heading == '에버라인' ? Color(0xff6FB245)
          : heading == '의정부' ? Color(0xffFDA600)
          : heading == '우이신설' ? Color(0xffB7C452)
          : heading == '김포골드' ? Color(0xffA17800)
          : Color(0xff6789CA); /// 신림
  }

}

