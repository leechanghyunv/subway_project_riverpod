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
    double mainBoxHeight = appHeight * 0.58;
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        width: appHeight / 6,
        child: Icon(
          Icons.subway,
          size: mainBoxHeight / 7,
        ),
      ),
    );
  }
}
