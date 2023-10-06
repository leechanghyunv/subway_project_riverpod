// Project imports:
import 'package:subway_project_230704/setting/export+.dart';
import 'package:subway_project_230704/setting/export.dart';
import 'display_object/main_text.dart';

const Color DropDown_color = Colors.black;
const Color DropDown_textcolor = Colors.black;

class DropdownCustom<T> extends StatefulWidget {

  final dynamic onChanged;
  final T value;

  DropdownCustom({
    Key? key,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.w,
        ),
        Container(
          height: 12.5.w,
          width: 22.w,
          color: DropDown_color,
          alignment: Alignment.center,
          child: DropdownButton<dynamic>(
              value: widget.value,
              dropdownColor: DropDown_color,
              underline: Container(
                alignment: Alignment.center,
                color: DropDown_color,
              ),
              icon: SizedBox.shrink(),
              style: const TextStyle(
                color: Colors.white,
              ),
              onChanged: widget.onChanged,
              items: <dynamic>[
                'Line1', 'Line2', 'Line3', 'Line4', 'Line5', 'Line6', 'Line7', 'Line8', 'Line9', '신분당', '수인분당', '경의선','경춘선', '우이신설','공항철도',
              ].map<DropdownMenuItem<dynamic>>((dynamic value) {
                return DropdownMenuItem<dynamic>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: Device.aspectRatio > 0.5 ? 20.sp : 19.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              }).toList()),
        ),
        SizedBox(
          height: 2.h,
        ),
        MainText(),
      ],
    );
  }
}
