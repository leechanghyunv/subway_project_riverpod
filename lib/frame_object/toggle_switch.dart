import 'package:subway_project_230704/setting/export.dart';

class ToggleController extends StatefulWidget {

  final OnToggle? onToggle;

  const ToggleController({Key? key, this.onToggle}) : super(key: key);

  @override
  State<ToggleController> createState() => _Toggle_ControllerState();
}

class _Toggle_ControllerState extends State<ToggleController> {
  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;  ///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;  /// 414.0 IPHONE11
    double iconSize = appWidth * 0.0485;
    return ToggleSwitch(
      minWidth: appWidth * 0.1024,
      minHeight: appWidth * 0.0604,  /// 25
      fontSize: appWidth * 0.0362,  /// 15
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