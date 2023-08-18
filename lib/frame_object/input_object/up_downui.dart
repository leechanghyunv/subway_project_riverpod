

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    double appHeight = MediaQuery.of(context).size.height;
    return Container(
      width: appHeight * 0.224,
      height: appHeight * 0.056,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: appHeight * 0.132,
            height: appHeight * 0.056,
          ),
          Row(
            children: [
              Container(
                color: color1,
                width: appHeight * 0.036,
                height: appHeight * 0.04,
                child: GestureDetector(
                  onTap: onTap1,
                  child: Icon(
                    Icons.keyboard_double_arrow_up,
                    size: appHeight * 0.0339,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                color: color2,
                width: appHeight * 0.036,
                height: appHeight * 0.04,
                child: GestureDetector(
                  onTap: onTap2,
                  child: Icon(
                    Icons.keyboard_double_arrow_down,
                    size: appHeight * 0.0339,
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
