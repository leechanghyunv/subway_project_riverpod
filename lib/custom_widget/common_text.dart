// Project imports:
import '../setting/export+.dart';
import '../setting/export.dart';

const String intro = 'Send SMS를 누르시면 민원문자를 보내실 수 있습니다. 지하철 민원 신고시 통로문 또는 출입문 위 칸번호 4~6자리와 종착역을 기재하셔야 빠른 민원이 가능합니다.';
const String ex = '\n ex)오이도행 (열차번호)4764, 8-3번 추워요 에어컨 틀어주세요';

const String msg = '(열차번호)C0:진입\n(열차번호)C1:도착\n(열차번호)C2:출발\n(열차번호)C3:전역출발\n(열차번호)C4:전역진입\n(열차번호)C5:전역도착\n(열차번호)C99:운행중\n\nU: 상행, D: 하행';
const String msg2 = '열차에서 내리는 방향\n급행열차(반대방향)';

const String frame_msg = '일반열차 : NOR(S)\n급행열차 : EXP(S)\nITX : ITX(T)';

 String sms1 = '\n출발지 열차정보: ($des1) $sub1번';
 String sms2 = '\n출발지 열차정보: ($des2) $sub2번';

const String qrdata = '1234ffov3pp5oq23lk';

final timetext = DateFormat('EEEE\naa hh:mm').format(DateTime.now());
final timetextB = DateFormat('MM/dd ').format(DateTime.now());
final providertome = DateFormat('aa hh:mm').format(DateTime.now());

Widget Time() => TimerBuilder.periodic(
  const Duration(seconds: 1),
  builder: (context) => TextFrame(
          comment: '${DateFormat('M월 dd일').
          format(DateTime.now())} ${formatDate(DateTime.now(),
          [' ',am ,  ' ', hh, '시 ', nn, '분'])}'
      ),
);

/// distance_provider에 들어감
Widget Time_Provider() => TimerBuilder.periodic(
  const Duration(seconds: 1),
  builder: (context) =>
      TextFrame(
          comment: '현재시간: ${formatDate(DateTime.now(),
          [' ',am ,  ' ', hh, '시 ', nn, '분'])}'
      ),
);

Widget BlinkComment(String text,double size) => BlinkText(
  text, style: TextStyle(
    fontSize: size,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  duration: const Duration(milliseconds: 410), /// 깜빡이는 간격이라고 한다
);


textAstyleL(String head,String state) => TextStyle(
    color: head == 'LEFT' ? headingColor(state) : Colors.black,
    fontSize: Device.aspectRatio >= 0.5 ? 19.sp : 18.sp,
    fontWeight: FontWeight.bold
);

textAstyleR(String head,String state) => TextStyle(
    color: head == 'RIGHT' ? headingColor(state) : Colors.black,
    fontSize: Device.aspectRatio >= 0.5 ? 19.sp : 18.sp,
    fontWeight: FontWeight.bold
);

final commonTextStyle = TextStyle(
  fontSize: 3.7.w,
  fontWeight: FontWeight.bold,
);

tableexstyle(String express) => TextStyle(
    fontSize: 2.8.w,
    color: express == 'GENERAL' ? Colors.black : Colors.red,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis
);

final tablecommon = TextStyle(
  fontSize: 2.8.w,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final dialogcommon = TextStyle(
  fontSize: 3.3.w,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final commonmin = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final dialogABC = TextStyle(
  fontSize: 3.35.w,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final textframe = TextStyle(
  fontSize: Device.aspectRatio >= 0.5 ? 19.sp : 18.sp,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final name_textframe = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 17.sp
);

final dropdown = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 3.62.w,
);


Color headingColor (String heading) {
  return  heading == 'Line1' ? Color(0xff2a4193)
      : heading == 'Line2' ? Color(0xff027a31)
      : heading == 'Line3' ? Color(0xffd75e02)
      : heading == 'Line4' ? Color(0xff028bb9)
      : heading == 'Line5' ? Color(0xff9637b6)
      : heading == 'Line6' ? Color(0xff885408)
      : heading == 'Line7' ? Color(0xff525d02)
      : heading == 'Line8' ? Color(0xfff62d37)
      : heading == 'Line9' ? Color(0xff916a2a)
      : heading == '서해' ? Color(0xff8FC31F)
      : heading == '공항철도' ? Color(0xff0090D2)
      : heading == '경의선' ? Color(0xff77C4A3)
      : heading == '경춘선' ? Color(0xff0C8E72)
      : heading == '수인분당' ? Color(0xFFE7E727)
      : heading == '신분당' ? Color(0xffD4003B)
      : heading == '경강선' ? Color(0xff003DA5)
      : heading == '인천1선' ? Color(0xff7CA8D5)
      : heading == '인천2선' ? Color(0xffED8B00)
      : heading == '에버라인' ? Color(0xff6FB245)
      : heading == '의정부' ? Color(0xffFDA600)
      : heading == '우이신설' ? Color(0xffB7C452)
      : heading == '김포골드' ? Color(0xffA17800)
      : Color(0xff6789CA); /// 신림
}
