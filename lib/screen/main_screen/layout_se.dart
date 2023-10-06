// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

Widget Layout_Se(
    Widget colorBar,
    Widget dropDown,
    Widget iconCustom,
    Widget upandDown,
    Widget toggleCustom,
    void Function()? ontap
    ) =>
    Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: 100.h,
        width: 100.w,
        child: Column(
          children: <Widget>[
            TopDesign(),
            SizedBox(
              width: 88.5.w,
              child:  Column(
                children: <Widget>[
                  DottedLine(
                    dashLength: 12, dashGapLength: 4.5, lineThickness: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      colorBar,
                      SizedBox(
                        width: 2.w,
                      ),
                      dropDown,

                      SizedBox(
                        width: 8.5.w,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5.5.w,
                          ),
                          SizedBox(
                              width: 36.2.w,
                              child: iconCustom
                          ),
                          SizedBox(
                            height: 3.5.w,
                          ),
                          TextContainerA(),
                          upandDown,
                          SizedBox(
                            height: 1.w,
                          ),
                          TextContainerB(),
                          SizedBox(
                            height: 2.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      toggleCustom,
                    ],
                  ),
                  SizedBox(
                    height: 2.w,
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
);
