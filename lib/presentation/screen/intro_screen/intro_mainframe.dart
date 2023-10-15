// Project imports:
import '../../../setting/export.dart';
import '../../../setting/export+.dart';

Widget IntroLayer_main(iconSize,key1,key2,key3,key4,key5,key6)
=> SafeArea(child: Scaffold(
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
          child: Column(
            children: <Widget>[
              DottedLine(
                dashLength: 12, dashGapLength: 6, lineThickness: 7,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        height: 52.h,
                        width: 8.w,
                        color: Color(0xff027a31),
                        alignment: Alignment.center,
                        child: Container(
                          key: key1,
                          height: 25.h,
                          width: 8.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 2.4.w,
                  ),
                  DropdownCustom(
                    onChanged: (val){}, value: 'Line2',),
                  SizedBox(
                    width: 8.w,
                  ),

                  Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        key: key2,
                        width: 36.2.w,
                        child: Icon(
                          Icons.subway, size: 18.w,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextContainerA(),
                      UpandDown(
                        color1: Colors.grey[400],
                        color2: Colors.grey[100],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      TextContainerB(),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ToggleSwitch(
                    minWidth: 10.5.w,
                    minHeight: 6.w,
                    fontSize: 3.5.w,/// 15
                    totalSwitches: 3,
                    initialLabelIndex: null,
                    doubleTapDisable: true,
                    activeBgColor: [Colors.grey.shade600],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey[200],
                    inactiveFgColor: Colors.black,
                    customIcons: [
                      Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.black,
                        size: iconSize,
                        key: key3,
                      ),
                      Icon(
                        Icons.settings,
                        size: iconSize,
                        key: key4,
                      ),
                      Icon(
                        Icons.keyboard_double_arrow_left,
                        color: Colors.black,
                        size: iconSize,
                        key: key5,
                      ),
                    ],
                    onToggle: (index){},
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container_Left(),
                    BottomForIntro(),
                    Container_Right(key6),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
));
