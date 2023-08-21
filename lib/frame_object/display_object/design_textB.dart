import 'package:subway_project_230704/setting/export.dart';
import 'package:intl/intl.dart';

class TextContainerB extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double mainBoxHeight = appHeight * 0.58;

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
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: mainBoxHeight / 25),
                      ),
                    ),
                    SizedBox(
                      height: mainBoxHeight / 60,
                    ),
                    ToopTipWidget(
                          message: DateFormat('EEEE\naa hh:mm').format(DateTime.now()),
                          child: Text(
                            DateFormat('MM/dd ').format(DateTime.now()),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: mainBoxHeight / 25),
                          ),
                        ),
                  ],
                ),
                /// DATE
                SizedBox(
                  width: mainBoxHeight / 27.5,
                ),
                Consumer(
                  builder: (context,ref,child){
                    final code = ref.watch(codeConveyProvider);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ToopTipWidget(
                        message: '출발지점의 역사코드\n열차번호: ${code}',
                        child: Text(
                          'CODE',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: mainBoxHeight / 25),
                        ),
                      ),
                      SizedBox(
                        height: mainBoxHeight / 60,
                      ),
                      ToopTipWidget(
                              message: '출발지점 역사코드\n열차번호: ${code}',
                              child: Text(code.isNotEmpty
                                  ? '${code}'
                                  : '0000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: mainBoxHeight / 25),
                              ),
                            ),
                    ],
                  );
                  }
                ),
                /// SEAT
                SizedBox(
                  width: mainBoxHeight / 27.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ToopTipWidget(
                      message: '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : TIX(T)',
                      child: Text(
                        'CLASS',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: mainBoxHeight / 25),
                      ),
                    ),
                    SizedBox(
                      height: mainBoxHeight / 60,
                    ),

                    Consumer(builder: (context, ref, widget){
                      final upDown = ref.watch(upDownProvider);
                      /// btrainSttus
                      if(upDown == 1){
                        return ToopTipWidget(
                          message: '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : TIX(T)',
                          child: Text( '${sttuus(box.read('state1') ?? 'NOR(S)')}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: mainBoxHeight / 25),
                          ),
                        );
                      }else if(upDown == -1){

                        return ToopTipWidget(
                          message: '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : TIX(T)',
                          child: Text( '${sttuus(box.read('state2') ?? 'NOR(S)')}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: mainBoxHeight / 25),
                          ),
                        );
                      }
                      return ToopTipWidget(
                        message: '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : TIX(T)',
                        child: Text( 'NOR(S)',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: mainBoxHeight / 25),
                        ),
                      );
                    }),

                  ],
                ),
              ],
            ),
            SizedBox(
              height: mainBoxHeight / 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PASSENGER :',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: mainBoxHeight / 25),
                ),
                SizedBox(
                  height: mainBoxHeight / 40,
                ),
                Text(
                  box.read('name') ?? userName,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: mainBoxHeight / 30),
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
    return 'TIX(T)';
  }

}