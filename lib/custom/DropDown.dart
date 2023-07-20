
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../parts/MainText.dart';

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
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    double mainBoxHeight = appHeight * 0.58;/// 520   ~ 519.68

    return Column(
      children: [
        SizedBox(height: mainBoxHeight / 25,
        ),
        Container(
          height: appWidth * 0.13,
          width: mainBoxHeight / 5.5,
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
                        fontSize: mainBoxHeight / 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              }).toList()),
        ),
        SizedBox(
          height: mainBoxHeight / 25,
        ),
        MainText(),
      ],
    );
  }
}