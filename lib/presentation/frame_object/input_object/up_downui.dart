// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

class UpandDown extends StatelessWidget {
  final Color? color1;
  final Color? color2;
  final Function()? onTap1;
  final Function()? onTap2;

  const UpandDown({
    Key? key,
    this.color1,
    this.color2,
    this.onTap1,
    this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  48.w,
      height: 5.6.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 28.w,
            height: 5.6.h,
          ),
          Row(
            children: [
              Container(
                color: color1,
                width: 7.8.w,
                height: 4.h,
                child: GestureDetector(
                  onTap: onTap1,
                  child: Icon(
                    Icons.keyboard_double_arrow_up,
                    size: 7.25.w,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                color: color2,
                width: 7.8.w,
                height: 4.h,
                child: GestureDetector(
                  onTap: onTap2,
                  child: Icon(
                    Icons.keyboard_double_arrow_down,
                    size: 7.25.w,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
