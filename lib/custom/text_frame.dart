import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class TextFrame extends StatelessWidget {

  final String comment;
  final TextOverflow? overflow;
  final Color? color;

  const TextFrame({
    super.key,
    required this.comment,
    this.overflow,
    this.color});

  @override
  Widget build(BuildContext context) {
    final filtered = comment.replaceAll(RegExp(r'\([^()]*\)'), '');

    final commonTextStyle = TextStyle(
      fontSize: 3.7.w,
      fontWeight: FontWeight.bold,
      color: color,
    );

    if(comment.contains('급행')){ /// 급행일때는 깜빡이고 도착일때는 색깔이 바뀌는 에니매이션을 고려중이다.
      return BlinkText(
        filtered,
        style: commonTextStyle.copyWith(
          color: Colors.black,
        ),
        beginColor: Colors.black,
        duration: Duration(milliseconds: 500), /// 깜빡이는 간격이라고 한다.
        times: 2, /// 깜빡이는 횟수라고 한다.
      );
    } else if(comment.contains('진입')){
      return BlinkText(
        filtered,
        style: commonTextStyle.copyWith(
          color: Colors.black,
        ),
        beginColor: Colors.black,
        duration: Duration(milliseconds: 500), /// 깜빡이는 간격이라고 한다.
        times: 2, /// 깜빡이는 횟수라고 한다.
      );
    } else
      return Text(
        filtered,
        style: commonTextStyle.copyWith(
          color: Colors.black,
        ),
      );
  }
}