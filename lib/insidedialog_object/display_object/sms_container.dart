import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

class SmsContainer extends ConsumerWidget {
   SmsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    double textSize = 3.63.w;
    double textSize2 = 3.35.w;

    common(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

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
          Text(intro, style: common(textSize),
          ),
          Text(ex, style: common(textSize2),
          ),
          Consumer(builder: (context, ref, widget){
            final upDown = ref.watch(upDownProvider);
            if(upDown == 1){
              Clipboard.setData(
                  ClipboardData(text: '$des1 $sub1번'));
              return BlinkText(
                sms1, style: common(textSize2),
                duration: Duration(milliseconds: 500), /// 깜빡이는 간격이라고 한다.
                times: 2, /// 깜빡이는 횟수라고 한다.
              );
            }else if(upDown == -1){
              Clipboard.setData(
                  ClipboardData(text: '$des2 $sub2번'));
              return BlinkText(
                sms2, style: common(textSize2),
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
