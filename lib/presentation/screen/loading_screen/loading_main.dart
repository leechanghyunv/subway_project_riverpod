// Project imports:

import '../../../setting/export.dart';
import '../../../setting/export+.dart';

class LoadingFrame extends StatefulWidget {
  const LoadingFrame({super.key});

  @override
  State<LoadingFrame> createState() => _LoadingFrameState();
}

class _LoadingFrameState extends State<LoadingFrame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: 100.h,
            width: 100.w,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: Device.aspectRatio >= 0.5 ? 20.h : 17.h,
                ), /// TopDesign
                Container(
                  color: Colors.white,
                  width: Device.aspectRatio >= 0.5 ? 88.5.w : 91.5.w,
                  child: Column(
                    children: <Widget>[
                      LoadingDottedLine(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColorBarVoid(),
                          SizedBox(
                            width: Device.aspectRatio >= 0.5 ? 2.w : 2.4.w,
                          ),
                          TextObject(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


Widget LoadingDottedLine() => DottedLine(
  dashLength: 12,
  dashGapLength: Device.aspectRatio >= 0.5 ? 4.5 : 6,
  lineThickness: Device.aspectRatio >= 0.5 ? 5 : 7,
  dashColor: Colors.white,
);

Widget ColorBarVoid() => Column(
  children: [
    SizedBox(height: 6.w),
    SizedBox(
      height: Device.aspectRatio >= 0.5 ? 58.5.h : 52.h,
      width: 8.w,
    ),
  ],
);

Widget TextObject() => Column(
  children: [
    SizedBox(
      height: 5.w,
    ),
    Container(
      height: 12.5.w,
      width: 22.w,
    ),
    SizedBox(
      height: 2.h,
    ),
    Container(
      height: Device.aspectRatio >= 0.5 ? 50.3.h : 44.5.h,
      child: RotatedBox(
        quarterTurns: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlinkText('SEOUL',style: TextStyle(
                fontSize: 32.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              duration: Duration(milliseconds: 250),
            ),

            Text('',style: TextStyle(
                color: Colors.black,
                fontSize:  14.sp,
                fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis)
            ),
          ],
        ),
      ),
    ),
  ],
);
