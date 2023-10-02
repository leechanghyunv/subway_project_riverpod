import '../setting/export+.dart';
import '../setting/export.dart';

void getNoticeTime(
    String nameA,
    String nameB,
    String route,
    int time){
  Get.snackbar(
    '', '',
    titleText: titleTextWidgetB(
        '$nameB -> $nameA ',
        '${(time/60).toStringAsFixed(0)}분'),
    messageText: messageTextWidget(
        '도착 시간 2분전에 알람을 울립니다.',
        '이동경로 : $route'),
    backgroundColor: Colors.grey[100],
    icon: const Icon(Icons.subway),
    shouldIconPulse: true,
    duration: Duration(seconds: 7),
  );
}

void getAnotherNotice(
    int time,
    String path,
    String pathtype,
    String route){
  Get.snackbar(
    '', '',
    titleText: titleTextWidget(
        '지하철기준 빠른 경로가 없습니다.',
        '다른 교통 수단 검색경로:',
        '${(time/60).toStringAsFixed(0)}분'),
    messageText: messageTextWidget(
        '빠른경로 ${path == '2'
            ? '(버스)'
            : path == '3'
            ? '(버스-지하철)'
            : '---'} : $pathtype',
        route),
    backgroundColor: Colors.grey[100],
    shouldIconPulse: true,
    duration: Duration(seconds: 7),
  );
}

Widget titleTextWidget(String text1, String text2, String text3) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
     Padding(
      padding: EdgeInsets.all(2.0),
      child: TextFrame(comment: text1),
    ),
    Padding(
      padding:  EdgeInsets.all(2.0),
      child: Row(
        children: [
           TextFrame(
              comment: text2),
          BlinkText(
            text3,
            style: commonTextStyle,
            beginColor: Colors.black,
            duration: Duration(milliseconds: 500),
            times: 2,
          ),
          const TextFrame(comment: ' 소요'),
        ],
      ),
    ),
  ],
);

Widget messageTextWidget(String text1, String text2) => Padding(
  padding: EdgeInsets.all(2.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(2.0),
        child: Text(
            text1,style: TextStyle(fontSize: 3.5.w)
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2),
        child: Text(text2, style: TextStyle(fontSize: 3.5.w),),
      ),
    ],
  ),
);

Widget for_distance() => TimerBuilder.periodic(
  const Duration(seconds: 1),
  builder: (context) =>
      Row(
        children: [
          TextFrame(
              comment: DateFormat('MM월 dd일 ').
              format(DateTime.now())),
          TextFrame(
              comment: formatDate(DateTime.now(),
                  ['' ,  am,' ', h, '시 ', nn, '분 '])
          ),
        ],
      ),
);

Widget titleTextWidgetB(String text1, String text2) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(2.0),
      child: for_distance(),
    ),
    Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          TextFrame(comment: text1),
          BlinkText(
            text2,
            style: commonTextStyle,
            beginColor: Colors.black,
            duration: Duration(milliseconds: 500),
            times: 2,
          ),
          const TextFrame(comment: ' 소요'),
        ],
      ),
    ),
  ],
);

