import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screen/layout_screen.dart';
import '../setting/initival_value.dart';

class SmsContainer extends ConsumerWidget {
  const SmsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11

    double textSize = appWidth * 0.0362;
    double textSize2 = appWidth * 0.0335;

    return Container(
      height: appWidth * 0.46,/// 150
      width: appWidth * 0.6268,/// 260
      // color: b1,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Send SMS를 누르시면 민원문자를 보내실 수 있습니다. 지하철 민원 신고시 통로문 또는 출입문 위 칸번호 4~6자리와 종착역을 기재하셔야 빠른 민원이 가능합니다.',
            style: TextStyle(
                fontSize: textSize,
                fontWeight:FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            '\n ex)오이도행 (열차번호)4764, 8-3번 추워요 에어컨 틀어주세요',
            style: TextStyle(
                fontSize: textSize2,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Consumer(builder: (context, ref, widget){
            final upDown = ref.watch(upDownProvider);
            final name = ref.watch(nameProvier);
            if(upDown == 1){
              return BlinkText(
                '\n출발지 열차정보: (${box.read('destination1') ?? ''}) ${box.read('subNumber1') ?? '0000'}번',
                style: TextStyle(
                    fontSize: textSize2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                duration: Duration(milliseconds: 500), /// 깜빡이는 간격이라고 한다.
                times: 2, /// 깜빡이는 횟수라고 한다.
              );
            }else if(upDown == -1){
              return BlinkText(
                '\n출발지 열차정보: (${box.read('destination1') ?? ''}) ${box.read('subNumber2') ?? '0000'}번',
                style: TextStyle(
                    fontSize: textSize2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                duration: Duration(milliseconds: 500), /// 깜빡이는 간격이라고 한다.
                times: 2, /// 깜빡이는 횟수라고 한다.
              );
            }
            return SizedBox.shrink();
          })

        ],
      ),
    );
  }
}
