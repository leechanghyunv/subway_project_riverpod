// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

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
    if (comment.contains('급행') || comment.contains('진입')) {
      return BlinkText(
        filtered,
        style: commonTextStyle,
        beginColor: Colors.black,
        duration: Duration(milliseconds: 500),
        times: 2,
      );
    } else {
      return Text(
        filtered,
        style: commonTextStyle,
      );
    }
  }
}
