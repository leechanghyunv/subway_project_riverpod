// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:subway_project_230704/setting/export.dart';

class InputName extends StatefulWidget {
  final Function(String) onSubmitted;

  const InputName({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {

  TextEditingController _controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double iconSize = 6.w;
    double textSize = 3.62.w;

    return Container(
      width: 61.w,
      height: 15.6.w,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(
            Icons.person,
            size: iconSize,
            color: Colors.black,
          ),
          suffixIcon: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () {
                _controllerName.clear();
              },
              child: Icon(
                Icons.clear,
                size: iconSize,
                color: Colors.black,
              ),
            ),
          ),
          labelText: 'Enter your name',
          hintStyle: TextStyle(color: Colors.black),
          hintText: '입력 후 완료버튼을 누르세요',
          labelStyle: TextStyle(
              fontSize: textSize),
        ),
        onChanged: widget.onSubmitted,
      ),
    );
  }
}
