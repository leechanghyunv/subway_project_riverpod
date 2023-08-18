import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconCustom extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;

  const IconCustom({
    Key? key,
    this.onTap,
    this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double mainBoxHeight = appHeight * 0.58;
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        width: appWidth * 0.3623,  /// 150
        child: Icon(
          Icons.subway,
          size: appWidth * 0.1812, /// 75
        ),
      ),
    );
  }
}
