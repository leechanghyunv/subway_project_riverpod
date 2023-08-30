import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

import 'intro_mainframe.dart';

class LayoutIntro extends StatefulWidget {
  const LayoutIntro({super.key});

  @override
  State<LayoutIntro> createState() => _LayoutIntroState();
}

class _LayoutIntroState extends State<LayoutIntro> {

  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey button0 = GlobalKey();
  GlobalKey button1 = GlobalKey();
  GlobalKey button2 = GlobalKey();
  GlobalKey button3 = GlobalKey();
  GlobalKey button4 = GlobalKey();
  GlobalKey button5 = GlobalKey();
  GlobalKey button6 = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_layout);
    initTargets();
  }

  void _layout(_){
    Future.delayed(Duration(milliseconds: 100));
    showTutorial();
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
        colorShadow: Colors.grey.shade400,
        textSkip: "**SKIP**",
        textStyleSkip: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 17.sp),
        paddingFocus: 10,
        opacityShadow: 0.8,
        onFinish: () {
          print("finish");
        },
        targets: targets)..show(context: context);

  }

  void initTargets (){
    targets.add(
        TargetFocus(
            identify: "Target 0",
            keyTarget: button0,
            shape: ShapeLightFocus.RRect,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: TutorialContainer([
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            child: Image.asset('images/weather.png',),
                          ),
                        ),
                      ],
                    ),

                  ),
                ]),
              ),
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 1",
            keyTarget: button1,
            shape: ShapeLightFocus.RRect,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                child: TutorialContainer([
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('지하철역 검색 저장,이름 저장',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('images/searching.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 2",
            keyTarget: button2,
            shape: ShapeLightFocus.RRect,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: TutorialContainer([
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('출발지점 실시간 지하철 이동확인',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('images/realtime1.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 3",
            keyTarget: button3,
            shape: ShapeLightFocus.RRect,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: TutorialContainer([
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('가까운 지하철역 리스팅,SMS민원신고,네이버지도',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('images/retreive.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 4",
            keyTarget: button4,
            shape: ShapeLightFocus.RRect,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: TutorialContainer([
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('출발지점 실시간 지하철 이동확인(반대방향)',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('images/realtime2.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ]
        )
    );
    targets.add(
        TargetFocus(
            identify: "Target 5",
            keyTarget: button5,
            shape: ShapeLightFocus.RRect,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: TutorialContainer([
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('출발지점의 시간표',
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Image.asset('images/timetable.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 4.85.w;
    if(Device.aspectRatio >= 0.5){
      return IntroLayer_se(iconSize,button0,button1,button2,button3,button4,button5);
    }
    return IntroLayer_main(iconSize,button0,button1,button2,button3,button4,button5);
  }
}

Widget TutorialContainer(List<Widget> widget) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    border: Border.all(width: 1,color: Colors.black),
    color: Colors.white,
  ),
  alignment: Alignment.center,
  child: Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget
    ),
  ),
);

Widget Container_Left() => Container(
  width: 15.w,
  height: 12.h,
  color: Colors.transparent,
);
Widget Container_Right(key) => Container(
  key: key,
  width: 15.w,
  height: 12.h,
  color: Colors.transparent,
);

Widget BottomForIntro() => Container(
    alignment: Alignment.center,
    width: 55.w,
    height: 12.h,
    child: BarcodeWidget(
      data: '------LAFAYETTE.co-------',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: Device.aspectRatio >= 0.5 ? 2.h : 1.8.h,
      ),
      color: Colors.black,
      barcode: Barcode.code128(),
    ));







