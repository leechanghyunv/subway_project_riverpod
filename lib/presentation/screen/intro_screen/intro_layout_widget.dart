// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';
import '../main_screen.dart';
import 'intro_mainframe.dart';

class LayoutIntro extends StatefulWidget {
  const LayoutIntro({super.key});

  @override
  State<LayoutIntro> createState() => _LayoutIntroState();
}

class _LayoutIntroState extends State<LayoutIntro> {

  SharedPreManager sharedPreManager = SharedPreManager();

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
    sharedPreManager.init();
    sharedPreManager.setIsFirst(false);
    sharedPreManager.setFirstLoading(false);
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
        textStyleSkip: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 17.sp
        ),
        paddingFocus: 10,
        opacityShadow: 0.8,
        onFinish: () {
          sharedPreManager.setIsFirst(false);
          accident();
          Navigator.push(
            context, PageTransition(
              child: HomePage(),
              type: PageTransitionType.fade
          ),
          );
        },
        onSkip: (){
          sharedPreManager.setIsFirst(false);
          accident();
          Navigator.push(
            context, PageTransition(
              child: HomePage(),
              type: PageTransitionType.fade
          ),
          );
        },
        targets: targets)..show(context: context);

  }

  Widget Comment(String text) =>  Padding(
    padding:  EdgeInsets.all(8.0),
    child: Text(
      text, style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  Widget ContainImage(String location) => Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      child: Image.asset(location),
    ),
  );

  void initTargets (){
    sharedPreManager.setIsFirst(false);
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
                        Comment('컬러바를 눌러서 온도, 미세먼지 농도 확인'),
                        ContainImage('images/weather.png'),
                        Comment('미세 먼지 농도에 따라 좌측 컬러바 색 변경'),
                        Row1(),
                        SizedBox(height: 10.sp),
                        Row2(),
                        SizedBox(height: 10.sp)
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
                        Comment('지하철역 검색 저장,이름 저장'),
                        ContainImage('images/searching.jpg'),
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
                        Comment('출발지점 실시간 지하철 이동확인'),
                        ContainImage('images/realtime1.jpg'),
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
                        Comment('가까운 지하철역 리스팅,SMS민원신고,네이버지도'),
                        ContainImage('images/retreive.jpg'),
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
                        Comment('출발지점 실시간 지하철 이동확인(반대방향)'),
                        ContainImage('images/realtime2.jpg'),
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
                        Comment('출발지점의 시간표'),
                        ContainImage('images/timetable.jpg'),
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
      return IntroLayer_se(iconSize,button0,button1,button2,
          button3,button4,button5);
    }
    return IntroLayer_main(iconSize,button0,button1,button2,
        button3,button4,button5);
  }
}

Widget TutorialContainer(
    List<Widget> widget) => Container(
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


Widget Row1() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.square,color: Color(0xff027a31),size: 17.5.sp),
    TextFrame(comment: '미세먼지 양호'),
    SizedBox(width: 15.sp,),
    Icon(Icons.square,color: Color(0xff028bb9),size: 17.5.sp),
    TextFrame(comment: '미세먼지 아주 양호'),
  ],
);

Widget Row2() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.square,color: Color(0xffd75e02),size: 17.5.sp),
    TextFrame(comment: '미세먼지 나쁨'),
    SizedBox(width: 15.sp,),
    Icon(Icons.square,color: Color(0xfff62d37),size: 17.5.sp),
    TextFrame(comment: '미세먼지 아주 나쁨'),
  ],
);

Widget Container_Left() => Container(
  width: 15.w,
  height: Device.aspectRatio >= 0.5 ? 12.h : 11.5.h,
  color: Colors.transparent,
);
Widget Container_Right(key) => Container(
  key: key,
  width: 15.w,
  height: Device.aspectRatio >= 0.5 ? 12.h : 11.5.h,
  color: Colors.transparent,
);
Widget BottomForIntro() => Container(
    alignment: Alignment.center,
    width: 55.w,
    height: Device.aspectRatio >= 0.5 ? 12.h : 11.5.h,
    child: BarcodeWidget(
      data: '------LAFAYETTE.co-------',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: Device.aspectRatio >= 0.5
            ? 2.1.h
            : 1.8.h,
      ),
      color: Colors.black,
      barcode: Barcode.code128(),
    ));







