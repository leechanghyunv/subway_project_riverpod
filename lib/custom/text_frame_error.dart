import '../setting/export.dart';

class TextFrame_Error extends StatelessWidget {

  final String comment;
  final Color? color;

  const TextFrame_Error({super.key, required this.comment, this.color});

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;
    return Text(comment,
    style: TextStyle(
      fontSize: appWidth * 0.0242,
      fontWeight: FontWeight.bold,
      color: color,
    ),);
  }
}

