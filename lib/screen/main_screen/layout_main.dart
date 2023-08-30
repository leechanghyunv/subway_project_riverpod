import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

Widget Layout_Main(
    Widget colorBar,
    Widget dropDown,
    Widget iconCustom,
    Widget upandDown,
    Widget toggleCustom,
    void Function()? ontap,
    ) =>
    SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          height: 100.h,
          width: 100.w,
          child: Column(
            children: <Widget>[
              TopDesign(),
              Container(
                color: Colors.white,
                width: 91.5.w,
                child:  Column(
                  children: <Widget>[
                    DottedLine(
                      dashLength: 12, dashGapLength: 6, lineThickness: 7,
                    ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      colorBar, ///
                      SizedBox(
                        width: 2.4.w,
                      ),
                      dropDown,
                      SizedBox(
                        width: 8.5.w,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 6.w,
                          ),
                          SizedBox(
                            width: 36.2.w,
                            child: iconCustom,
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          TextContainerA(),
                          upandDown,
                          TextContainerB(),
                        ],
                      ),
                    ]
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        toggleCustom,
                      ],
                    ),
                    SizedBox(
                      height: 3.w,
                    ),
                    BottomDesign(
                      onTap: ontap,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);