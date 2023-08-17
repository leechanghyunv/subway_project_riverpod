import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    double appHeight = MediaQuery.of(context).size.height;    ///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;    ///  896.0 IPHONE11
    double iconSize = appWidth * 0.06039;
    double textSize = appWidth * 0.0362;

    return Container(
      width: appWidth * 0.604,
      height: appWidth * 0.156,
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
