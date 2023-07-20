import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final void Function()? onLongPress;
  final void Function()? onPressed;
  final String comment;

  const DialogButton(
      {Key? key, this.onPressed, required this.comment, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11

    return SizedBox(
      child: GestureDetector(
        child: TextButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          child: Container(
            child: Text(
              comment,
              style: TextStyle(
                  fontSize: appHeight * 0.0168,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
