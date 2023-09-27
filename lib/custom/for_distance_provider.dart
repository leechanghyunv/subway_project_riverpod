import '../setting/export+.dart';
import '../setting/export.dart';

Widget titleTextWidget(String text1, String text2,String text3) => Column(
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
              comment: formatDate(DateTime.now(), ['' ,  am,' ', h, '시 ', nn, '분 '])
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

