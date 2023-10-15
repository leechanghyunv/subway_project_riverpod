// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';

class DialogButton extends StatelessWidget {
  final void Function()? onLongPress;
  final void Function()? onPressed;
  final String comment;

  const DialogButton(
      {Key? key, this.onPressed, required this.comment, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        child: TextButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          child: Container(
            child: Text(
              comment,
              style: TextStyle(
                  fontSize: 3.62.w,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
          ),
        ),
      ),
    );
  }
}
