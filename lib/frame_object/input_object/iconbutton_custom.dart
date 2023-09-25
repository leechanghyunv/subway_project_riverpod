import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IconCustom extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;

  const IconCustom({
    key,
    this.onTap,
    this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        key: key,
        width: 36.2.w,
        child: Icon(
          Icons.subway,
          size: 18.w
        ),
      ),
    );
  }
}


