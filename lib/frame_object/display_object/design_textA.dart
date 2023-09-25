import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class TextContainerA extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {

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
              ToolTipWidget(
                message:msg,
                child: Text('NUMBER', style: textframe)),
              SizedBox(height: 2.w,
              ),
              Consumer(
                  builder: (context, ref, widget){
                final upDown = ref.watch(upDownProvider);
                if(upDown == 1){
                  /// 상행선일때
                  return ToolTipWidget(
                    message: msg,
                    child: Row(
                      children: [
                        Text('${sub1}U', style: textframe),
                        Text(state1, style: textframe),
                      ],
                    ),
                  );
                }else if(upDown == -1){
                  /// 하행선일때
                  return ToolTipWidget(
                    message: msg,
                    child: Row(
                      children: [
                        Text('${sub2}D', style: textframe),
                        Text(state2, style: textframe),
                      ],
                    ),
                  );
                }
                return ToolTipWidget(
                  message: msg,
                  child: Text('3728C99', style: textframe),
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
              ToolTipWidget(
                message: msg2,
                child: Text('GATE', style: textframe),
              ),

              SizedBox(
                height: 2.w,
              ),

              ToolTipWidget(
                message: msg2,
                child: Consumer(
                    builder: (context,ref,widget){
                      final gateText = ref.watch(headingProvider);
                      return RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: gateText == 'RIGHT' ? 'RIGH'
                                  : gateText == 'LEFT' ? 'L'
                                  : gateText == null ? '01'
                                  : '01',
                              style: textAstyleL(gateText,state),
                            ),
                            TextSpan(
                              text: gateText == 'RIGHT' ? 'T'
                                  : gateText == 'LEFT' ? 'EFT'
                                  : gateText == null ? '00'
                                  : '00',
                              style: textAstyleR(gateText,state),
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
}

