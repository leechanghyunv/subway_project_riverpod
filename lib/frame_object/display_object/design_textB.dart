import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class TextContainerB extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {

     String msg2(String cost) => '지하철요금\n$cost원';

    final userName = ref.watch(userNameProvier);

    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ToolTipWidget(
                      message: timetext,
                      child: Text('DATE', style: textframe,
                      ),
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    ToolTipWidget(
                          message: timetext,
                          child: Text(timetextB, style: textframe,
                          ),
                        ),
                  ],
                ),
                /// DATE
                SizedBox(
                  width: 4.5.w,
                ),
                Consumer(
                  builder: (context,ref,child){
                    final cost = ref.watch(costProvider);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ToolTipWidget(
                        message: msg2(cost),
                        child: Text('FARE ', style: textframe),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      ToolTipWidget(
                              message: msg2(cost),
                              child: Text(cost.isNotEmpty
                                  ? cost
                                  : '0000',
                                style: textframe
                              ),
                            ),
                    ],
                  );
                  }
                ),
                /// SEAT
                SizedBox(
                  width: 4.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ToolTipWidget(
                      message: frame_msg,
                      child: Text('CLASS', style: textframe),
                    ),
                    SizedBox(
                      height: 2.w,
                    ),

                    Consumer(builder: (context, ref, widget){
                      final upDown = ref.watch(upDownProvider);
                      /// btrainSttus
                      if(upDown == 1){
                        return ToolTipWidget(
                          message: frame_msg,
                          child: Text( status(trainstate1),
                            style: textframe,
                          ),
                        );
                      }else if(upDown == -1){

                        return ToolTipWidget(
                          message: frame_msg,
                          child: Text( status(trainstate2),
                            style: textframe
                          ),
                        );
                      }
                      return ToolTipWidget(
                        message: frame_msg,
                        child: Text( 'NOR(S)', style: textframe),
                      );
                    }),

                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PASSENGER :', style: textframe),
                SizedBox(
                  height: 1.4.h,
                ),
                Text(
                  box.read('name') ?? userName,
                  style: name_textframe,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String status (String state){
    if(state == '일반'){
      return 'NOR(S)';
    }else if(state == '급행'){
      return 'EXP(S)';
    }
    return 'ITX(T)';
  }

}