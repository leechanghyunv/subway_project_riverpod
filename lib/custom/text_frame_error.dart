import '../setting/export.dart';
import '../setting/export+.dart';

class TextFrame_Error extends StatelessWidget {

  final String comment;
  final Color? color;

  const TextFrame_Error({super.key, required this.comment, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(comment,
    style: TextStyle(
      fontSize: 2.4.w,
      fontWeight: FontWeight.bold,
      color: color,
    ),
    );
  }
}


