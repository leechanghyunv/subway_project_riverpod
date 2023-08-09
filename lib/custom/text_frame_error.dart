import '../setting/export.dart';

class TextFrame_Error extends StatelessWidget {

  final String comment;
  final Color? color;

  const TextFrame_Error({super.key, required this.comment, this.color});

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    return Text(comment,
    style: TextStyle(
      fontSize: appHeight * 0.0118,
      fontWeight: FontWeight.bold,
      color: color,
    ),);
  }
}

