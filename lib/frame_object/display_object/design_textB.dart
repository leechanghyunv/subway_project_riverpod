import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class TextContainerB extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final common = TextStyle(
      fontSize: Device.aspectRatio >= 0.5 ? 19.sp : 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

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
                    ToopTipWidget(
                      message: DateFormat('EEEE\naa hh:mm').format(DateTime.now()),
                      child: Text(
                        'DATE',
                        style: common,
                      ),
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    ToopTipWidget(
                          message: DateFormat('EEEE\naa hh:mm').format(DateTime.now()),
                          child: Text(
                            DateFormat('MM/dd ').format(DateTime.now()),
                            style: common,
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
                      ToopTipWidget(
                        message: '지하철요금\n${cost}원',
                        child: Text(
                          'FARE ',
                          style: common,
                        ),
                      ),
                      SizedBox(
                        height: 2.w,
                      ),
                      ToopTipWidget(
                              message: '지하철요금\n${cost}원',
                              child: Text(cost.isNotEmpty
                                  ? '${cost}'
                                  : '0000',
                                style: common,
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
                    ToopTipWidget(
                      message: '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : ITX(T)',
                      child: Text(
                        'CLASS',
                        style: common,
                      ),
                    ),
                    SizedBox(
                      height: 2.w,
                    ),

                    Consumer(builder: (context, ref, widget){
                      final upDown = ref.watch(upDownProvider);
                      /// btrainSttus
                      if(upDown == 1){
                        return ToopTipWidget(
                          message: '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : ITX(T)',
                          child: Text( '${sttuus(box.read('state1') ?? 'NOR(S)')}',
                            style: common,
                          ),
                        );
                      }else if(upDown == -1){

                        return ToopTipWidget(
                          message: '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : ITX(T)',
                          child: Text( '${sttuus(box.read('state2') ?? 'NOR(S)')}',
                            style: common,
                          ),
                        );
                      }
                      return ToopTipWidget(
                        message: '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : TIX(T)',
                        child: Text( 'NOR(S)',
                          style: common,
                        ),
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
                Text(
                  'PASSENGER :',
                  style: common,
                ),
                SizedBox(
                  height: 1.4.h,
                ),
                Text(
                  box.read('name') ?? userName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
              ],
            ),
            /// PASSENGER NAME
          ],
        ),
      ),
    );
  }

  String sttuus (String state){
    if(state == '일반'){
      return 'NOR(S)';
    }else if(state == '급행'){
      return 'EXP(S)';
    }
    return 'ITX(T)';
  }

}