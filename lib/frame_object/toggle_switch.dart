import 'package:subway_project_230704/setting/export.dart';
import 'package:subway_project_230704/setting/export+.dart';

class ToggleController extends StatefulWidget {

  final OnToggle? onToggle;

  const ToggleController({Key? key, this.onToggle}) : super(key: key);

  @override
  State<ToggleController> createState() => _Toggle_ControllerState();
}

class _Toggle_ControllerState extends State<ToggleController> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 4.85.w;
    return ToggleSwitch(
      minWidth: 10.5.w,
      minHeight: 6.w,
      fontSize: 3.5.w,/// 15
      totalSwitches: 3,
      initialLabelIndex: null,
      doubleTapDisable: true,
      activeBgColor: [Colors.grey.shade600],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey[200],
      inactiveFgColor: Colors.black,
      customIcons: [
         Icon(
          Icons.keyboard_double_arrow_right,
          color: Colors.black,
          size: iconSize,
        ),
         Icon(
          Icons.settings,
          size: iconSize,
        ),
         Icon(
          Icons.keyboard_double_arrow_left,
          color: Colors.black,
          size: iconSize,
        ),
      ],
      onToggle: widget.onToggle,
    );
  }
}