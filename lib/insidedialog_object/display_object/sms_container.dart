import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';


class SmsContainer extends ConsumerWidget {
   SmsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    double textSize = appWidth * 0.0362;
    double textSize2 = appWidth * 0.0335;

    return Container(
      height: 46.w,/// 150
      width: 62.6.w,/// 260
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
            if(upDown == 1){
              print('상행상행상행 ${box.read('destination1') ?? ''}');
              Clipboard.setData(
                /// destination 당고개행 /// subNumber1 1239
                  ClipboardData(text: '${box.read('destination1') ?? ''} ${box.read('subNumber1') ?? '0000'}번'));
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
              print('하행하행하행 ${box.read('destination2') ?? ''}');
              Clipboard.setData(
                /// destination 당고개행 /// subNumber1 1239
                  ClipboardData(text: '${box.read('destination2') ?? ''} ${box.read('subNumber2') ?? '0000'}번'));
              return BlinkText(
                '\n출발지 열차정보: (${box.read('destination2') ?? ''}) ${box.read('subNumber2') ?? '0000'}번',
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
